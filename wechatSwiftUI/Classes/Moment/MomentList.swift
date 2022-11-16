//
//  MomentList.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import SwiftUI

struct MomentList: View {
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 50) {
                
                MomentHeader()
                
                Button("点击返回") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
}

struct MomentList_Previews: PreviewProvider {
    static var previews: some View {
        MomentList()
    }
}
