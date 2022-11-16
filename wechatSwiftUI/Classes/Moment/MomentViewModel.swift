//
//  MomentViewModel.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import Foundation
import SwiftUI
import Combine

class MomentViewModel: ObservableObject {
    
    @Published var list: [MomentModel] = []
    
    init() {
        requestLists()
    }
    
    func requestLists() {
        
        ApiService<Api, MomentJSON>.request(target: .moment_list(page: 1), success: { [weak self] json in
            guard let self = self else { return }
            self.list = json.data?.list ?? []
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.list = []
        })
    }
}


