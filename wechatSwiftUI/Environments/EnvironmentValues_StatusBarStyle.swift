//
//  EnvironmentValues_StatusBarStyle.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import Foundation
import UIKit
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



// MARK: - 以下这种方式更新 `statusBarStyle`
/// 需要info 添加两个key
/// `UIViewControllerBasedStatusBarAppearance` = NO 禁止启用新方式
/// `UIStatusBarStyle` 默认的设置 `UIStatusBarStyleLightContent` / `UIStatusBarStyleDefault`
/// 否则需要通过HostController 桥接到控制器实现，比较麻烦些


extension EnvironmentValues {
    
    var statusBarStyle: StatusBarStyle { self[StatusBarStyle.Key.self] }
}

class StatusBarStyle {
    
    var getter: () -> UIStatusBarStyle = { UIApplication.shared.statusBarStyle }
    var setter: (UIStatusBarStyle) -> Void = { value in
        UIApplication.shared.statusBarStyle = value
    }
    
    var current: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

extension StatusBarStyle {
    
    struct Key: EnvironmentKey {
        typealias Value = StatusBarStyle
        static let defaultValue: StatusBarStyle = StatusBarStyle()
    }
}

