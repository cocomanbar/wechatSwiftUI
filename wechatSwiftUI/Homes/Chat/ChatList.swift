//
//  ChatList.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct ChatList: View {
    
    @ObservedObject var viewModel: ChatViewModel = ChatViewModel()
    
    var body: some View {
        
        ScrollView {
            SearchBar()
            
            LazyVStack(spacing: 0) {
                
                ForEach(viewModel.list) { chat in
                    NavigationLink(destination: ChatRoom()) {
                        ChatRow(model: chat)
                    }
                    Separator().padding(.leading, 76)
                }
            }
            .background(Color("cell"))
        }
        .onAppear(perform: viewAppear)
    }
    
    func viewAppear() {
        
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
