//
//  Dot.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/14.
//

import SwiftUI

struct Dot: View {
    
    var color: Color
    
    var body: some View {
        Circle()
            .fill(color)
    }
    
    init(color: Color = Color("discover_dot_color")) {
        self.color = color
    }
}

struct Dot_Previews: PreviewProvider {
    static var previews: some View {
        Dot()
    }
}
