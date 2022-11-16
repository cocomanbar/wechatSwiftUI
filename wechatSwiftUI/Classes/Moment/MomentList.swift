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
            LazyVStack (spacing: 500) {
                
                MomentHeader()
                    .anchorPreference(key: Moment.NavigationKey.self, value: .bottom) { anchor in
                        [anchor]
                    }
                
                Button("点击返回") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    
    
    // Use isPresented or dismiss
    @Environment(\.presentationMode) var presentationMode
}




struct MomentList_Previews: PreviewProvider {
    static var previews: some View {
        MomentList()
    }
}
