//
//  MomentList.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import SwiftUI

struct MomentList: View {
    
    @ObservedObject var viewModel: MomentViewModel = MomentViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 0) {
                
                MomentHeader()
                    .frame(maxWidth: .infinity)
                    .anchorPreference(key: Moment.NavigationKey.self, value: .bottom) { anchor in
                        [anchor]
                    }
                
                Section {
                    ForEach(viewModel.list) { model in
                        MomentRow(model: model)
                    }
                }
                .background(.white)   
            }
        }
    }
}




struct MomentList_Previews: PreviewProvider {
    static var previews: some View {
        MomentList()
    }
}
