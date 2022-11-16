//
//  ChatViewModel.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import Foundation
import SwiftUI
import Combine

class ChatViewModel: ObservableObject {
    
    @Published var list: [ChatModel] = []
    
    init() {
        requestLists()
    }
    
    func requestLists() {
        
        ApiService<Api, ChatJSON>.request(target: .chat_list, success: { [weak self] json in
            guard let self = self else { return }
            self.list = json.data?.list ?? []
        }, failure: { [weak self] error in
            guard let self = self else { return }
            self.list = []
        })
    }
}
