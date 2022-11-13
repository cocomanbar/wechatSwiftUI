//
//  ChatMessage.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import Foundation
import SwiftUI
import HandyJSON

enum ChatMessageType {
    case text
    case image
    case video
    case location
    case redPacket
    case emotion
    case system
}

struct ChatMessageModel {
    
    var user_info: ChatUserModel
    var messageType: ChatMessageType
    var message: MessageModel
}

struct MessageModel {
    
    var image: String?
    var videoUrl: String?
    var content: String?
}
