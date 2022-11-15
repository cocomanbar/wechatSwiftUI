//
//  ApiService.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import Foundation
import Moya
import HandyJSON

enum ApiError: Error {
    case urlError(info: [String: Any])
    case netError(info: [String: Any])
    case decodeError(info: [String: Any])
    
    var description: String {
        switch self {
        case .urlError(_):
            return "url错误"
        case .netError(_):
            return "请求异常"
        case .decodeError(_):
            return "解析异常"
        }
    }
}

protocol NetworkJSON: HandyJSON {
    associatedtype Data
    
    var code: Int { get }
    var msg: String {  get }
    var data: Data? { get }
}

struct NetworkEmptyData: HandyJSON {
    
    init() {}
}

struct NetworkEmptyJSON {
    typealias Data = NetworkEmptyData
    
    var code: Int = .max
    var msg: String = ""
    var data: NetworkEmptyData? = nil
    
    init() {}
}

struct ApiMock: PluginType {
    
    func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError> {
        
        var json_name: String = ""
        switch target.path {
        case "api/wechat/contact":
            json_name = "contact_net_json"
        case "api/wechat/discover":
            json_name = "discover_net_json"
        case "api/wechat/mine":
            json_name = "mine_net_json"
        default:
            break
        }
        
        guard json_name.isEmpty == false else {
            return result
        }
        
        guard let url: URL = Bundle.main.url(forResource: json_name, withExtension: "json") else {
            return result
        }
        
        do {
            let data = try Data(contentsOf: url)
            let dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
            let jsondata = try JSONSerialization.data(withJSONObject: dict as Any, options: JSONSerialization.WritingOptions.fragmentsAllowed)
            let response = Moya.Response(statusCode: 200, data: jsondata)
            return Result<Response, MoyaError>.success(response);
        } catch {
            return result
        }
    }
}

class ApiService<T, JSON> where T:TargetType, JSON: NetworkJSON {
    
    typealias SuccessCallback = ((JSON) -> Void)?
    typealias FailureCallback = ((ApiError) -> Void)?
    
    static func request(target: T,
                        queue: DispatchQueue? = .main,
                        configuration: ApiServiceConfiguraion? = .default,
                        success: SuccessCallback,
                        failure: FailureCallback)
    {
        let configuration = configuration
        
        let endPointClosure = { (target: T) -> Endpoint in
            let defaultEndPoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndPoint
        }
        
        let requestClosure = { (endPoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
            do {
                var urlRequest = try endPoint.urlRequest()
                // 设置网络超时时间，默认15s
                urlRequest.timeoutInterval = configuration?.timeoutInterval ?? 15
                
                done(.success(urlRequest))
            } catch  {
                done(.failure(MoyaError.underlying(error, nil)))
            }
        }
        
        /*
         public init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                     requestClosure: @escaping RequestClosure = MoyaProvider.defaultRequestMapping,
                     stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                     callbackQueue: DispatchQueue? = nil,
                     session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                     plugins: [PluginType] = [],
                     trackInflights: Bool = false)
         */
        
        let mock = ApiMock()
        
        let provider = MoyaProvider<T>(endpointClosure: endPointClosure, requestClosure: requestClosure, callbackQueue: queue, plugins: [mock])
        
        // public typealias Completion = (_ result: Result<Moya.Response, MoyaError>) -> Void
        provider.request(target) { result in
            switch result {
            case .success(let resp):
                do {
                    let response = try resp.filter(statusCode: 200)
                    guard let json = try response.mapJSON() as? [String: Any] else {
                        failure?(.decodeError(info: [:]))
                        return
                    }
                    guard let resultJSON = JSON.deserialize(from: json) else {
                        failure?(.decodeError(info: [:]))
                        return
                    }
                    success?(resultJSON)
                } catch {
                    failure?(.decodeError(info: [:]))
                }
            case .failure(let error):
                failure?(.decodeError(info: ["code": "\(error.errorCode)"]))
            }
        }
    }
    
}

struct ApiServiceConfiguraion {
    
    static let `default` = ApiServiceConfiguraion()
    
    var timeoutInterval: TimeInterval = 2
    
    
}
