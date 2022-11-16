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
    static func showTabBar(_ animate: Bool = true) {
        UIApplication.shared.key?.allSubView().forEach({ subView in
            if let view = subView as? UITabBar, view.isHidden == true {
                view.isHidden = false
                var rect = view.frame
                rect.origin.y -= view.frame.height
                UIView.animate(withDuration: 0.25) {
                    view.frame = rect
                } completion: { finished in
                }
            }
        })
    }
    
    static func hideTabBar(_ animate: Bool = true) {
        UIApplication.shared.key?.allSubView().forEach({ subView in
            if let view = subView as? UITabBar, view.isHidden == false {
                var rect = view.frame
                rect.origin.y += view.frame.height
                UIView.animate(withDuration: 0.25) {
                    view.frame = rect
                } completion: { finished in
                    view.isHidden = true
                }
            }
        })
    }
}

struct ShowTabBar: ViewModifier {
    var animate: Bool = true
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.showTabBar(animate)
        }
    }
    init(animate: Bool) {
        self.animate = animate
    }
}

struct HiddenTabBar: ViewModifier {
    var animate: Bool = true
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            TabBarModifier.hideTabBar(animate)
        }
    }
    init(animate: Bool) {
        self.animate = animate
    }
}

extension View {
    
    @discardableResult
    func showTabBar(_ animate: Bool = true) -> some View {
        return self.modifier(ShowTabBar(animate: animate))
    }

    @discardableResult
    func hiddenTabBar(_ animate: Bool = true) -> some View {
        return self.modifier(HiddenTabBar(animate: animate))
    }
}
