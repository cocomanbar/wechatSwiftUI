//
//  LottieView.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/21.
//

import Foundation
import SwiftUI
import Lottie

/*
 public convenience init(
   name: String,
   bundle: Bundle = Bundle.main,
   imageProvider: AnimationImageProvider? = nil,
   animationCache: AnimationCacheProvider? = LRUAnimationCache.sharedCache,
   configuration: LottieConfiguration = .shared)
 {
   let animation = LottieAnimation.named(name, bundle: bundle, subdirectory: nil, animationCache: animationCache)
   let provider = imageProvider ?? BundleImageProvider(bundle: bundle, searchPath: nil)
   self.init(animation: animation, imageProvider: provider, configuration: configuration)
 }
 */

public enum LottiePlayStatus: Int {
    case initial    // 初始
    case play       // 播放
    case pause      // 暂停
    case stop       // 停止
}

public enum LottieData {
    case name(_ name: String, bundle: Bundle = Bundle.main)
    case url(_ url: URL)
    case path(_ path: String)
    case json(_ json: [String: Any])
}

public struct LottieView: UIViewRepresentable {
    
    public var lottieData: LottieData
    
    @Binding public var status: LottiePlayStatus
    @State  var animationView: LottieAnimationView = LottieAnimationView()
    
    /// 创建view，走一次
    public func makeUIView(context: Context) -> UIView {
        
        let contentView = UIView()
        let createBlock = {
            contentView.addSubview(animationView)
            animationView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                animationView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                animationView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
            ])
            animationView.loopMode = .loop
        }
        
        switch lottieData {
        case .name(let name, let bundle):
            createBlock()
            animationView.animation = LottieAnimation.named(name, bundle: bundle)
        case .url(let url):
            createBlock()
            do {
                let data = try Data.init(contentsOf: url)
                let animation = try LottieAnimation.from(data: data)
                animationView.animation = animation
            } catch {
                
            }
        case .path(let path):
            animationView = LottieAnimationView(filePath: path)
            createBlock()
        case .json(let json):
            createBlock()
            do {
                let animation = try LottieAnimation(dictionary: json)
                animationView.animation = animation
            } catch {
            }
        }
        return contentView
    }
    
    /// 更新view，走多次
    public func updateUIView(_ uiView: UIView, context: Context) {
        switch status {
        case .pause:
            animationView.pause()
        case .play:
            animationView.play()
        case .stop:
            animationView.stop()
        default:
            animationView.stop()
        }
    }
}

