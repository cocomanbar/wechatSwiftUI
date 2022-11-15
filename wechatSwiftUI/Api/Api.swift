//
//  Api.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import Foundation
import Moya

enum Api {
    case chatList
    case contact
    case discover
    case mine
    case session_moments(page: Int)
}

extension Api: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://192.168.9.81/")!
    }
    
    var path: String {
        switch self {
        case .chatList: return "api/wechat/chatList"
        case .contact: return "api/wechat/contact"
        case .discover: return "api/wechat/discover"
        case .mine: return "api/wechat/mine"
        case .session_moments(let page):
            return "api/wechat/session_moments/\(page)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .chatList: return .get
        case .contact: return .get
        case .discover: return .get
        case .mine: return .get
        case .session_moments(_):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .session_moments(let page):
            return .requestParameters(parameters: ["page": "\(page)"], encoding: URLEncoding.default)
        default :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
