//
//  ChatMessage.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import Foundation
import SwiftUI

enum ChatMessageType {
    case text
    case image
    case video
    case location
    case redPacket
    case emotion
    case system
}

struct ChatMessage {
    
    var user_info: ChatUser
    var messageType: ChatMessageType
    var message: Message
}

struct ChatUser {
    
    var avatar: String?
    var user_name: String?
}

struct Message {
    
    var image: String?
    var videoUrl: String?
    var content: String?
}
