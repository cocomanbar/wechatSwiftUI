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
    
    @Published var discoverList: [DiscoverListModel] = []
    
    init() {
        requestDiscovers()
    }
    
    func requestDiscovers() {
        
        ApiService<Api, DiscoverJson>.request(target: .discover, success: { [weak self] json in
            guard let self = self else { return }
            self.discoverList = json.data?.list ?? []
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.discoverList = []
        })
    }
}

