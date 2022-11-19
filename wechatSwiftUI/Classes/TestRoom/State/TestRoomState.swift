//
//  TestRoomState.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/19.
//

import SwiftUI

struct TestRoomState: View {
    var title: String = ""
    
    var body: some View {
        Text("Hello, World!")
            .navigationTitle(title)
    }
}

struct TestRoomState_Previews: PreviewProvider {
    static var previews: some View {
        TestRoomState()
    }
}
