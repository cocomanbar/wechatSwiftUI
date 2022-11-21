//
//  FunRoomLocalization.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/19.
//

import SwiftUI

struct FunRoomLocalization: View {
    var title: String = ""
    
    @State var turn: Bool = false
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 20) {
                                
                Text(turn ? "TestRoom_Test".localized : "TestRoom_Test".localized)
                
                Text("当前的语言环境id：\(locale.identifier) \n当前id词汇信息：TestRoom_Test")
                    .foregroundColor(.primary)
                    .font(.system(size: 18, weight: .heavy))
                
                Text("这个修饰器是针对全局环境的。通过它，我们可以避免在初始 View 时创建 ObservableObject, 而是从环境中获取 ObservableObject")
                    .lineLimit(Int.max)
                    .foregroundColor(.secondary)
                    .font(.system(size: 16, weight: .regular))
                
                Button("点击我，切换系统语言测试") {
                    if Language.shared.currentLanguage == "ja" {
                        Language.shared.currentLanguage = "en"
                    } else {
                        Language.shared.currentLanguage = "ja"
                    }
                    self.turn.toggle()
                }
                .frame(width: 300, height: 50)
                .background(.secondary)
            }
            .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
        }
        .navigationTitle(title)
    }
    
    /// 测试语言环境的变化，前提是需要添加多种语言
    @Environment(\.locale) var locale
}

struct FunRoomLocalization_Previews: PreviewProvider {
    static var previews: some View {
        FunRoomLocalization()
    }
}
