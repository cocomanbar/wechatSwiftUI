//
//  EnvironmentValues_StatusBarStyle.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import Foundation
import SwiftUI

/// SwiftUI使用Environment来传递系统范围的设置，例如ContentSizeCategory，LayoutDirection，ColorScheme等。
/// Environment还包含特定于应用程序的内容，例如UndoManager和NSManagedObjectContext。您可以在EnvironmentValues结构文档中找到传递值的完整列表

/// @Environment 就是 View 所在环境的各种环境变量信息的集合。你可以通过键路径 (key path) 对其读写
/// 用例1：Environment.colorScheme
///     根据 Light 和 Dark 两种系统颜色模式来调整 app 界面的配色是很常见的需求
///     struct ContentView: View {
///         // colorScheme values: .light, .dark
///         @Enviroment(\.colorScheme) var colorScheme
///         // dismiss
///         @Environment(\.presentationMode) var presentationMode
///
///         var body: some View {
///             Text("Hello, World")
///             .foregroundColor(colorScheme = .light ? .yellow : .blue)
///         }
///     }
///
/// 近似通知？


///     private struct MyEnvironmentKey: EnvironmentKey {
///         static let defaultValue: String = "Default value"
///     }
///
///     extension EnvironmentValues {
///         var myCustomValue: String {
///             get { self[MyEnvironmentKey.self] }
///             set { self[MyEnvironmentKey.self] = newValue }
///         }
///     }

extension EnvironmentValues {
    
    var statusBarStyle: StatusBarStyle { self[StatusBarStyle.Key.self] }
}

class StatusBarStyle {
    
    var getter: () -> UIStatusBarStyle = { .default }
    var setter: (UIStatusBarStyle) -> Void = { _ in }

    var current: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

extension StatusBarStyle {
    
    struct Key: EnvironmentKey {
        static let defaultValue: StatusBarStyle = StatusBarStyle()
    }
}


//struct StatusBarStyleKey: EnvironmentKey {
//
//    typealias Value = UIStatusBarStyle
//    static var defaultValue: UIStatusBarStyle = .default
//}
//
//extension EnvironmentValues {
//
//    var statusBarStyle: UIStatusBarStyle {
//        get { self[StatusBarStyleKey.self] }
//        set { self[StatusBarStyleKey.self] = newValue }
//    }
//}
//
////extension EnvironmentValues {
////
////    var statusBarStyle: StatusBarStyle {
////        self[StatusBarStyle.Key.self]
////    }
////}
//
//class StatusBarStyle {
//
//    fileprivate var statusStyle: UIStatusBarStyle = .default
//
//    fileprivate struct Key: EnvironmentKey {
//        static var defaultValue: StatusBarStyle = StatusBarStyle()
//    }
//
//    var current: UIStatusBarStyle {
//        get {
//            statusStyle
//        }
//        set {
//            statusStyle = newValue
//        }
//    }
//}

