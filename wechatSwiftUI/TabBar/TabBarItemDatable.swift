//
//  TabBarItemDatable.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import Foundation
import SwiftUI

enum TabBarItemDatable: Int {
    case chat
    case contact
    case discover
    case mine
    
    var image: Image {
        switch self {
        case .chat: return Image("root_tab_chat")
        case .contact: return Image("root_tab_contact")
        case .discover: return Image("root_tab_discover")
        case .mine: return Image("root_tab_me")
        }
    }
    
    var selectedImage: Image {
        switch self {
        case .chat: return Image("root_tab_chat_selected")
        case .contact: return Image("root_tab_contact_selected")
        case .discover: return Image("root_tab_discover_selected")
        case .mine: return Image("root_tab_me_selected")
        }
    }
    
    var title: String {
        switch self {
        case .chat: return "微信"
        case .contact: return "通讯录"
        case .discover: return "发现"
        case .mine: return "我的"
        }
    }
    
    static func itemDatable(selected: Int) -> TabBarItemDatable {
        TabBarItemDatable(rawValue: selected) ?? .chat
    }
}

struct TabBarItem: View {
    
    let type: TabBarItemDatable
    let selected: Int
    
    var body: some View {
        VStack {
            if (type.rawValue == selected) {
                type.selectedImage
            } else {
                type.image
            }
            Text(type.title)
        }
    }
}
