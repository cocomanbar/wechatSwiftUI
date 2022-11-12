//
//  ChatList.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct ChatList: View {
    
    @State private var chatList: [ChatModel] = []
    
    var body: some View {
        
        ScrollView {
            SearchBar()
            
            LazyVStack(spacing: 0) {
                
                ForEach(chatList) { chat in
                    NavigationLink(destination: ChatRoom(chat: chat)) {
                        ChatRow(model: chat)
                    }
                    Separator().padding(.leading, 76)
                }
            }
            .background(Color("cell"))
        }
        .onAppear(perform: load)
    }
    
    func load() {
        guard chatList.isEmpty else {
            return
        }
        chatList = ChatModel.swiftDisplayModels
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
