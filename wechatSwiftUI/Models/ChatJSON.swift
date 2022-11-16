//
//  ChatJSON.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import Foundation
import SwiftUI
import HandyJSON

struct ChatModel: Identifiable, HandyJSON {
    var id: String?
    var avatar: String?
    var user_name: String?
    var content: String?
    var time: String?
}

struct ChatDataJSON: HandyJSON {
    var list: [ChatModel]?
}

struct ChatJSON: NetworkJSON {
    typealias Data = ChatDataJSON
    
    var code: Int = .max
    var msg: String = ""
    var data: ChatDataJSON?
}



// MARK: - swiftUI Display

extension ChatModel: Modelable {
    
    typealias Model = ChatModel
    
    static var swiftDisplayModel: ChatModel {
        ChatModel(
            id: "1",
            avatar: "data_avatar1",
            user_name: "SwiftUI",
            content: "SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before.",
            time: "21:23")
    }
    
    static var swiftDisplayModels: [ChatModel] {
        []
    }
}
