//
//  EnvironmentValues_NavigationBarShadowImage.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/18.
//

import Foundation
import UIKit
import SwiftUI

extension EnvironmentValues {
    
    var navigationShadowImage: NavigationBarShadowImage { self[NavigationBarShadowImage.Key.self] }
}

class NavigationBarShadowImage {
    
    var getter: () -> UIImage? = { NavigationBarShadowModifier.getShadowImage() }
    var setter: (UIImage?) -> Void = { value in
        NavigationBarShadowModifier.setShadowImage(image: value)
    }
    
    var shadowImage: UIImage? {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

extension NavigationBarShadowImage {
    
    struct Key: EnvironmentKey {
        typealias Value = NavigationBarShadowImage
        static let defaultValue: NavigationBarShadowImage = NavigationBarShadowImage()
    }
}


struct NavigationBarShadowModifier {
    static func getShadowImage() -> UIImage? {
        guard let window = UIApplication.shared.delegate?.window else { return nil }
        guard let tabBat = window?.rootViewController as? UITabBarController else { return nil }
        guard let navigation = tabBat.selectedViewController as? UINavigationController else { return nil }
        let navBar: UINavigationBar = navigation.navigationBar
        return navBar.shadowImage
    }
    
    static func setShadowImage(image: UIImage?) {
        
        let scene: UIScene? = UIApplication.shared.connectedScenes.first
        let sceneDelegate: UIWindowSceneDelegate? = scene?.delegate as? UIWindowSceneDelegate
        guard let window = sceneDelegate?.window else {
            return
            
        }
        guard let controller = window?.rootViewController as? UIViewController else {
            return
        }
        guard let navigation = controller.navigationController else {
            return
        }
//        guard let navigation = tabBat.selectedViewController as? UINavigationController else { return }
//        let navBar: UINavigationBar = navigation.navigationBar
//        navBar.shadowImage = image
    }
}
