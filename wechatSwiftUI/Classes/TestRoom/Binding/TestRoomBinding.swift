//
//  TestRoomBinding.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/19.
//

import SwiftUI

struct TestRoomBinding: View {
    var title: String
    
    /// 独立空间
    @State var turn: Bool = false
    
    init(title: String = "") {
        self.title = title
    }
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 20) {
                Text(turn ? "按钮选中": "按钮还未选中")
                    .foregroundColor(.primary)
                    .font(.system(size: 18, weight: .heavy))
                Text("一个视图的属性传至子节点中，但是又不能直接的传递给子节点，因为在 Swift 中值的传递形式是值类型传递方式，也就是传递给子节点的是一个拷贝过的值。但是通过 @Binding 修饰器修饰后，属性变成了一个引用类型，传递变成了引用传递")
                    .lineLimit(Int.max)
                    .foregroundColor(.secondary)
                    .font(.system(size: 16, weight: .regular))
                
                /// 传递
                SubView(turn: $turn)
            }
            .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
        }
        .navigationTitle(title)
    }
}

struct SubView: View {
    
    /// 承接
    @Binding var turn: Bool
    
    var body: some View {
        ZStack {
            Color(.orange)
            
            Button("点击我") {
                self.turn.toggle()
            }
        }
        .frame(width: 200, height: 50)
    }
}

struct TestRoomBinding_Previews: PreviewProvider {
    static var previews: some View {
        TestRoomBinding()
    }
}
