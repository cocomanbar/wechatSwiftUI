//
//  MineJSON.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/15.
//

import Foundation
import HandyJSON
import SwiftUI

struct MineJSONData: HandyJSON {
    var list: [DiscoverListModel]?
}

struct MineJSON: NetworkJSON {
    typealias Data = MineJSONData
    
    var code: Int = .max
    var msg: String = ""
    var data: MineJSONData?
}
