//
//  Chat.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct Chat: View {
    var body: some View {
        NavigationView {
            ChatList()
            .navigationTitle(TabBarItemDatable.chat.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Leading(), trailing: Trailing())
        }
    }
}

private struct Leading: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "ellipsis")
                .resizable()
                .foregroundColor(.primary)
        }
    }
}

private struct Trailing: View {
    
    @State private var isPressented: Bool = false
    
    var body: some View {
        Button {
            isPressented = true
        } label: {
            Image(systemName: "plus.circle")
                .resizable()
                .foregroundColor(.primary)
        }
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
