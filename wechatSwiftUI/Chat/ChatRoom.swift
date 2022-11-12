//
//  ChatRoom.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct ChatRoom: View {
    
    let chat: ChatModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ChatRoom_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoom(chat: ChatModel.swiftDisplayModel)
    }
}
