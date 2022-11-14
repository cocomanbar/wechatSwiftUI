//
//  DiscoverJson.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/14.
//

import Foundation
import SwiftUI
import HandyJSON

struct DiscoverItemModel: Identifiable, HandyJSON {
    var id: String?
    var icon: String?
    var title: String?
    var right_icon: String?
}

struct DiscoverListModel: Identifiable, HandyJSON {
    
    var id: String?
    var rows: [DiscoverItemModel]?
}

struct DiscoverJsonData: HandyJSON {
    var list: [DiscoverListModel]?
}

struct DiscoverJson: NetworkJSON {
    typealias Data = DiscoverJsonData
    
    var code: Int = .max
    var msg: String = ""
    var data: DiscoverJsonData?
}


// MARK: - swiftUI Display

extension DiscoverItemModel: Modelable {
    typealias Model = DiscoverItemModel
    
    static var swiftDisplayModel: DiscoverItemModel {
        DiscoverItemModel(id: "1", icon: "me_bank_card", title: "卡片", right_icon: "me_bank_card")
    }
    
    static var swiftDisplayModels: [DiscoverItemModel] {
        []
    }
}
