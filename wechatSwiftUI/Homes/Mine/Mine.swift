//
//  Mine.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct Mine: View {
    var body: some View {
        ZStack {
            VStack {
                Color(.white).frame(height: 300)
                Color("separator")
            }
            
            MineList()
        }
        .showTabBar()
        .onAppear(perform: viewAppear)
        .onDisappear(perform: viewDisappear)
    }
    
    func viewAppear() {
        
    }
    
    func viewDisappear() {
        
    }
}

struct Mine_Previews: PreviewProvider {
    static var previews: some View {
        Mine()
    }
}
