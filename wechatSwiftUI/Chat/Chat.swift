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
                .navigationBarItems(leading: leading(), trailing: trailing())
        }
    }
}

private struct leading: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "ellipsis")
                .resizable()
                .foregroundColor(.primary)
        }
    }
}

private struct trailing: View {
    var body: some View {
        Button {
            
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
