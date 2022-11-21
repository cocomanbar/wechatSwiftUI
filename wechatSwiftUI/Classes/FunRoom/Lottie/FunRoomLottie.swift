//
//  FunRoomLottie.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/21.
//

import SwiftUI

struct FunRoomLottie: View {
    var title: String = ""
    
    @State var status: LottiePlayStatus = .play
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                
                viewForStatus()
                
                Button("播放") {
                    self.status = .play
                }
                .frame(height: 20)
                
                Button("暂停") {
                    self.status = .pause
                }
                .frame(height: 20)
                
                Button("停止") {
                    self.status = .stop
                }
                .frame(height: 20)
                
                LottieLocalView(name: "127399-cycle-rider.json", status: $status)
                    .frame(width: 100, height: 100)
                    .border(.pink)
            }
            .padding()
        }
        .navigationTitle(title)
    }
    
    func viewForStatus() -> AnyView {
        var text: String
        switch status {
        case .initial:
            text = "初始化"
        case .stop:
            text = "停止"
        case .pause:
            text = "暂停"
        case .play:
            text = "播放"
        }
        return AnyView(Text(text + "..状态").foregroundColor(.primary).font(.system(size: 18, weight: .heavy)))
    }
}

struct FunRoomLottie_Previews: PreviewProvider {
    static var previews: some View {
        FunRoomLottie()
    }
}
