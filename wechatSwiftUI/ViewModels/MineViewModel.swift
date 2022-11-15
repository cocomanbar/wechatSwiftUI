//
//  MineViewModel.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/15.
//

import Foundation
import SwiftUI
import Combine
import HandyJSON

class MineViewModel: ObservableObject {
    
    @Published var list: [DiscoverListModel] = []
    
    init() {
        requestLists()
    }
    
    func requestLists() {
        
        ApiService<Api, MineJson>.request(target: .mine, success: { [weak self] json in
            guard let self = self else { return }
            self.list = json.data?.list ?? []
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.list = []
        })
    }
}

