//
//  Modelable.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import Foundation
import SwiftUI

protocol Modelable {
    associatedtype Model
    
    static var swiftDisplayModel: Model { get }
    static var swiftDisplayModels: [Model] { get }
}
