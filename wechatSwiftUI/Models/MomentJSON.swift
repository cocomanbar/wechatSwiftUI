//
//  MomentJSON.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import Foundation
import SwiftUI
import HandyJSON

enum MomentType: Int, HandyJSONEnum {
    case moment = 0
    case adver = 1
}

struct MomentPicture: HandyJSON, Identifiable {
    var id: String?
    var pic: String?
    var w: Float = 0
    var h: Float = 0
}

struct MomentLike: HandyJSON {
    var id: String?
    var avatar: Int?
    var user_name: Int?
}

struct MomentModel: HandyJSON, Identifiable {
    
    var id: String?
    var user_info: UserModel?
    var content: String?
    var moment_type: MomentType = .moment
    var time: String?
    var location: String?
    var pictures: [MomentPicture]?
    var likes: [MomentLike]?
}

struct MomentJSONData: HandyJSON {
    var list: [MomentModel]?
}

struct MomentJSON: NetworkJSON {
    typealias Data = MomentJSONData
    
    var code: Int = .max
    var msg: String = ""
    var data: MomentJSONData?
}
