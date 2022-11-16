//
//  Moment.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import SwiftUI

struct Moment: View {
    var body: some View {
        MomentList()
            .hiddenTabBar()
            .navigationBarHidden(true)
            
    }
}

struct Moment_Previews: PreviewProvider {
    static var previews: some View {
        Moment()
    }
}
