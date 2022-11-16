//
//  ContactJSON.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import Foundation
import SwiftUI
import HandyJSON

struct ChatUserModel: HandyJSON {
    
    var avatar: String?
    var user_name: String?
}

struct ContactModel: Identifiable, HandyJSON {
    
    var id: String?
    var letter: String?
    var user_info: ChatUserModel?
}

struct ContactListModel: Identifiable, HandyJSON {
    
    var id: String?
    var letter: String?
    var rows: [ContactModel]?
}

struct ContactJSONData: HandyJSON {
    var list: [ContactListModel]?
}

struct ContactJSON: NetworkJSON {
    typealias Data = ContactJSONData
    
    var code: Int = .max
    var msg: String = ""
    var data: ContactJSONData?
}

extension ContactModel {
    
    static var newfriends: ContactModel {
        ContactModel(id: "1000001", letter: nil, user_info: ChatUserModel(avatar: "contact_new_friend", user_name: "新的朋友"))
    }
    
    static var chatroom: ContactModel {
        ContactModel(id: "1000002", letter: nil, user_info: ChatUserModel(avatar: "contact_chatroom", user_name: "群聊"))
    }
    
    static var chatsign: ContactModel {
        ContactModel(id: "1000003", letter: nil, user_info: ChatUserModel(avatar: "contact_sign", user_name: "标签"))
    }
}

// MARK: - swiftUI Display

extension ContactModel: Modelable {
    typealias Model = ContactModel
    
    static var swiftDisplayModel: ContactModel {
        ContactModel(id: "1", letter: "A", user_info: ChatUserModel(avatar: "data_avatar1", user_name: "李晓明"))
    }
    
    static var swiftDisplayModels: [ContactModel] {
        []
    }
}
