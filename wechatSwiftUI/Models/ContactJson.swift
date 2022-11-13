//
//  ContactModel.swift
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

struct ContactJsonData: HandyJSON {
    var list: [ContactListModel]?
}

struct ContactJson: NetworkJSON {
    typealias Data = ContactJsonData
    
    var code: Int = .max
    var msg: String = ""
    var data: ContactJsonData?
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
