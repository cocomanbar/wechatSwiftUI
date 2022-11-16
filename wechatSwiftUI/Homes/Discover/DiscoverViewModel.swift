//
//  DiscoverViewModel.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/14.
//

import Foundation
import SwiftUI
import Combine
import HandyJSON

class DiscoverViewModel: ObservableObject {
    
    @Published var list: [DiscoverListModel] = []
    
    init() {
        requestLists()
    }
    
    func requestLists() {
        
        ApiService<Api, DiscoverJSON>.request(target: .discover_list, success: { [weak self] json in
            guard let self = self else { return }
            self.list = json.data?.list ?? []
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.list = []
        })
    }
}

