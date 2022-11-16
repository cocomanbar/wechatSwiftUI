//
//  Api.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import Foundation
import Moya

enum Api {
    case chat_list
    case contact_list
    case discover_list
    case mine_list
    
    case moment_list(page: Int)
    
    struct ApiPath {
        static let chat_list = "api/wechat/chat_list"
        static let contact_list = "api/wechat/contact_list"
        static let discover_list = "api/wechat/discover_list"
        static let mine_list = "api/wechat/mine_list"
        
        static let moment_list = "api/wechat/moment_list"
    }
    
    static func mockJSON(path: String) -> String? {
        var json_name: String?
        switch path {
        case ApiPath.chat_list:
            json_name = "chat_list_net_json"
        case ApiPath.contact_list:
            json_name = "contact_list_net_json"
        case ApiPath.discover_list:
            json_name = "discover_list_net_json"
        case ApiPath.mine_list:
            json_name = "mine_list_net_json"
        case ApiPath.moment_list:
            json_name = "moment_list_net_json"
        default:
            break
        }
        return json_name
    }
}

extension Api: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://192.168.9.81/")!
    }
    
    var path: String {
        switch self {
        case .chat_list: return Api.ApiPath.chat_list
        case .contact_list: return Api.ApiPath.contact_list
        case .discover_list: return Api.ApiPath.discover_list
        case .mine_list: return Api.ApiPath.mine_list
        case .moment_list(_): return Api.ApiPath.moment_list
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .chat_list: return .get
        case .contact_list: return .get
        case .discover_list: return .get
        case .mine_list: return .get
        case .moment_list(_):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .moment_list(let page):
            return .requestParameters(parameters: ["page": "\(page)"], encoding: URLEncoding.default)
        default :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
