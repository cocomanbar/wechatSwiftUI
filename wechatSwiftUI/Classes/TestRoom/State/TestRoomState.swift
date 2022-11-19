//
//  TestRoomState.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/19.
//

import SwiftUI

struct TestRoomState: View {
    var title: String = ""
    
    @State private var  turn: Bool = false
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 20) {
                Text(turn ? "按钮选中": "按钮还未选中")
                    .foregroundColor(.primary)
                    .font(.system(size: 18, weight: .heavy))
                Text("@State是一个属性包装器，可以用来描述视图的状态。 SwiftUI会将其存储在View struct之外的特殊内存中, 只有相关视图才能访问它。当 @State 装饰过的属性发生了变化，SwiftUI 会根据新的属性值重新创建视图")
                    .lineLimit(Int.max)
                    .foregroundColor(.secondary)
                    .font(.system(size: 16, weight: .regular))
                Button("点击我") {
                    self.turn.toggle()
                }
                .frame(width: 200, height: 50)
                .background(.secondary)
            }
            .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
        }
        .navigationTitle(title)
    }
}

struct TestRoomState_Previews: PreviewProvider {
    static var previews: some View {
        TestRoomState()
    }
}
