//
//  TabBarHidden.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import Foundation
import SwiftUI

extension UIApplication {
    var key: UIWindow? {
        self.connectedScenes.map { $0 as? UIWindowScene }.compactMap({ $0 }).first?.windows.filter({ $0.isKeyWindow }).first
    }
}

extension UIView {
    func allSubView() -> [UIView] {
        var subs = subviews
        for subView in subviews {
            let resp = subView.allSubView()
            subs.append(contentsOf: resp)
        }
        return subs
    }
}

struct TabBarModifier {
    static func showTabBar() {
        UIApplication.shared.key?.allSubView().forEach({ subView in
            if let view = subView as? UITabBar {
                view.isHidden = false
            }
        })
    }
    
    static func hideTabBar() {
        UIApplication.shared.key?.allSubView().forEach({ subView in
            if let view = subView as? UITabBar {
                view.isHidden = true
            }
        })
    }
}

struct ShowTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.showTabBar()
        }
    }
}

struct HiddenTabBar: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.hideTabBar()
        }
    }
}

extension View {
    
    @discardableResult
    func showTabBar() -> some View {
        return self.modifier(ShowTabBar())
    }

    @discardableResult
    func hiddenTabBar() -> some View {
        return self.modifier(HiddenTabBar())
    }
}
