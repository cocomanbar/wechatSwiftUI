//
//  TestRoomGeometryReader.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/21.
//

import SwiftUI

struct TestRoomGeometryReader: View {
    var title: String = ""
    
    @State var changed: Bool = false
    
    var body: some View {
        GeometryReader(content: { proxy in
            makeView(proxy)
        })
        .frame(width: 300, height: 100)
        .navigationTitle(title)
        .border(.pink)
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
                
        return VStack(alignment: .leading, spacing: 0, content: {
            HStack(spacing: 0) {
                Image("data_avatar10")
                    .resizable()
                    .frame(width: changed ? 50 : 150, height: 80)
                
                TestRoomGeometryReaderText()
            }
            
            Button("改变") {
                self.changed.toggle()
            }
            .background(.purple)
        })
    }
}

struct TestRoomGeometryReaderText: View {
        
    var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .center, spacing: 0) {
                Text("哈哈哈哈哈哈哈哈哈 w：\(proxy.size.width) h：\(proxy.size.height)")
                    .foregroundColor(.primary)
                    .font(.system(size: 16, weight: .heavy))
                    .lineLimit(5)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .background(.orange)
            }
        }
    }
}

struct TestRoomGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        TestRoomGeometryReader()
    }
}
