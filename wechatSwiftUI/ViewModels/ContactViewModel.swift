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
    
    @Published var contactList: [ContactListModel] = []
    
    init() {
        requestContacts()
    }
    
    func requestContacts() {
        
        ApiService<Api, ContactJson>.request(target: .contact, success: { [weak self] json in
            guard let self = self else { return }
            self.contactList = json.data?.list ?? []
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.contactList = []
        })
    }
}
