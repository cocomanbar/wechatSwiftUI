//
//  Language.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/20.
//

import Foundation
import SwiftUI

public extension String {

    /// 国际化扩展
    var localized: String {
        Language.shared.localize(string: self, bundle: Bundle.main)
    }

    /// 带参数的国际化
    func localized(_ arguments: CVarArg...) -> String {
        Language.shared.localize(string: self, bundle: Bundle.main, arguments: arguments)
    }
}

enum Languages: CaseIterable {
    case en
    case zn_Hans
    case ja
}

public class Language {
    public static let shared = Language()
    private static let userDefaultsKey = "current_language"
    private static let defautLanguage = "ja"
    
    init() {
        currentLanguage = Language.storedCurrentLanguage ?? Language.defautLanguage
    }

    /// 可用的语言
    public static var availableLanguages: [String] {
        Bundle.main.localizations.sorted()
    }

    /// 当前语言
    public var currentLanguage: String {
        didSet {
            storeCurrentLanguage()
        }
    }

    /// 当前语言展示的名字
    public var currentLanguageDisplayName: String? {
        displayName(language: currentLanguage)
    }

    /// 根据语言国际化展示的名字
    public func displayName(language: String) -> String? {
        (currentLocale as NSLocale).displayName(forKey: NSLocale.Key.identifier, value: language)?.capitalized
    }
    /// 原始语言显示名称
    public static func nativeDisplayName(language: String) -> String? {
        let locale = NSLocale(localeIdentifier: language)
        return locale.displayName(forKey: NSLocale.Key.identifier, value: language)?.capitalized
    }
}

extension Language {

    /// 存储当前语言
    private func storeCurrentLanguage() {
        UserDefaults.standard.set(currentLanguage, forKey: Language.userDefaultsKey)
    }

    /// 获取存设置的语言
    private static var storedCurrentLanguage: String? {
        UserDefaults.standard.value(forKey: userDefaultsKey) as? String
    }

    /// 推荐语言
    private static var preferredLanguage: String? {
        Bundle.main.preferredLocalizations.first { availableLanguages.contains($0) }
    }
}

extension Language {

    public var currentLocale: Locale {
        Locale(identifier: currentLanguage)
    }
}

extension Language {

    public func localize(string: String, bundle: Bundle?) -> String {
        if let languageBundleUrl = bundle?.url(forResource: currentLanguage, withExtension: "lproj"), let languageBundle = Bundle(url: languageBundleUrl) {
            let str = languageBundle.localizedString(forKey: string, value: nil, table: nil)
            return str
        }

        return string
    }

    public func localize(string: String, bundle: Bundle?, arguments: [CVarArg]) -> String {
        String(format: localize(string: string, bundle: bundle), locale: currentLocale, arguments: arguments)
    }
}
