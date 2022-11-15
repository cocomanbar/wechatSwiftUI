//
//  MineJson.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/15.
//

import Foundation
import HandyJSON
import SwiftUI

struct MineJsonData: HandyJSON {
    var list: [DiscoverListModel]?
}

struct MineJson: NetworkJSON {
    typealias Data = MineJsonData
    
    var code: Int = .max
    var msg: String = ""
    var data: MineJsonData?
}
