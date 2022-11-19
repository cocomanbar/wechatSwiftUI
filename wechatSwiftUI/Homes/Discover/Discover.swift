//
//  Discover.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct Discover: View {
    
    var body: some View {
        NavigationView {
            DiscoverList()
                .showTabBar()
                .navigationTitle(TabBarItemDatable.discover.title)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: viewAppear)
                .onDisappear(perform: viewDisappear)
        }
    }
    
    func viewAppear() {
        navigationShadowImage.shadowImage = nil
    }
    
    func viewDisappear() {
        
    }
    
    @Environment(\.navigationShadowImage) var navigationShadowImage
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
