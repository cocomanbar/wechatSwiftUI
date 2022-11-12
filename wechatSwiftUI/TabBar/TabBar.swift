//
//  TabBar.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selected: Int = 0
    
    var body: some View {
        TabView(selection: $selected) {
            Chat()
                .tabItem { TabBarItem(type: .chat, selected: selected) }
                .tag(TabBarItemDatable.chat.rawValue)
            Contact()
                .tabItem { TabBarItem(type: .contact, selected: selected) }
                .tag(TabBarItemDatable.contact.rawValue)
            Discover()
                .tabItem { TabBarItem(type: .discover, selected: selected) }
                .tag(TabBarItemDatable.discover.rawValue)
            Mine()
                .tabItem { TabBarItem(type: .mine, selected: selected) }
                .tag(TabBarItemDatable.mine.rawValue)
        }
    }
}



struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
