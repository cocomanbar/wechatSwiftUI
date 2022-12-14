//
//  MineViewModel.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/15.
//

import Foundation
import SwiftUI
import Combine

class MineViewModel: ObservableObject {
    
    @Published var list: [DiscoverListModel] = []
    
    init() {
        requestLists()
    }
    
    func requestLists() {
        
        ApiService<Api, MineJSON>.request(target: .mine_list, success: { [weak self] json in
            guard let self = self else { return }
            self.list = json.data?.list ?? []
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.list = []
        })
    }
}

