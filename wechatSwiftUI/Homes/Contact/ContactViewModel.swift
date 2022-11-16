//
//  ContactViewModel.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import Foundation
import SwiftUI
import Combine

class ContactViewModel: ObservableObject {
    
    @Published var list: [ContactListModel] = []
    
    init() {
        requestLists()
    }
    
    func requestLists() {
        
        ApiService<Api, ContactJSON>.request(target: .contact_list, success: { [weak self] json in
            guard let self = self else { return }
            self.list = json.data?.list ?? []
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.list = []
        })
    }
}
