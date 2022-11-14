//
//  SpaceHolder.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/14.
//

import SwiftUI

struct SpaceHolder: View {
    var color: Color
    
    var body: some View {
        Rectangle()
            .fill(color)
    }
    
    init(color: Color = Color("discover_space_bg_color")) {
        self.color = color
    }
}

struct SpaceHolder_Previews: PreviewProvider {
    static var previews: some View {
        SpaceHolder()
    }
}
