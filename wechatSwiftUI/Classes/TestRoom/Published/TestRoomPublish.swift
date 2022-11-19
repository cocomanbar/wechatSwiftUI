//
//  TestRoomPublish.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/19.
//

import SwiftUI
import Combine

/// 主动push的对象遵守协议 `ObservableObject`
class TestRoomPusher: ObservableObject {
    
    /// 主动push变化
    @Published var finied: String = ""
    
    func done() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.finied = "ok"
        }
    }
}

struct TestRoomPublish: View {
    var title: String = ""
    
    /// 观察push对象
    @ObservedObject var pusher: TestRoomPusher = TestRoomPusher()
    
    var body: some View {
        VStack {
            Spacer()
            /// 触发变化
            Text("Hello, World! waiting after = \(pusher.finied) ")
            Spacer()
        }
        .onAppear( perform: pusher.done )
    }
}

struct TestRoomPublish_Previews: PreviewProvider {
    static var previews: some View {
        TestRoomPublish()
    }
}
