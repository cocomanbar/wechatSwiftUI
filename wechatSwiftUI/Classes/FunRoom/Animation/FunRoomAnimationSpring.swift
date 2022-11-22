//
//  FunRoomAnimationSpring.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/22.
//

import SwiftUI

struct FunRoomAnimationSpring: View {
    var title: String = ""
    
    let duration: CGFloat = 2
    
    @State var animate: Bool = false
    
    var body: some View {
        LazyVStack(spacing: 50, content: {
            
            if self.animate {
                Rectangle()
                    .fill(.purple)
                    .frame(width: 200, height: 50)
                    .animation(.linear(duration: duration), value: "")
            } else {
                RoundedRectangle(cornerRadius: 25)
                                .fill(Color.yellow)
                                .frame(width: 200, height: 50)
            }
            
            Button("执行动画") {
                withAnimation {
                    self.animate.toggle()
                }
            }
        })
        .navigationTitle(title)
    }
}


struct AnimationSpring: View {
    
    var body: some View {
        Rectangle()
            .background(.orange)
    }
}

struct FunRoomAnimationSpring_Previews: PreviewProvider {
    static var previews: some View {
        FunRoomAnimationSpring()
    }
}
