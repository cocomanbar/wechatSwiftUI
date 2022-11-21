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

enum LottiePlayStatus: Int {
    case initial    // 初始
    case play       // 播放
    case pause      // 暂停
    case stop       // 停止
}

struct LottieLocalView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    var name: String
    var bundle: Bundle = Bundle.main
    
    @Binding var status: LottiePlayStatus
    @State private var animationView: LottieAnimationView = LottieAnimationView()
    
    /// 创建view，走一次
    func makeUIView(context: Context) -> UIView {
        
        let contentView = UIView()
        contentView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        animationView.loopMode = .loop
        animationView.animation = LottieAnimation.named(name, bundle: bundle)
        return contentView
    }
    
    /// 更新view，走多次
    func updateUIView(_ uiView: UIView, context: Context) {
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
    
    /// SwiftUI 的 coordinators 被设计来扮演 UIKit 视图控制器的委托的角色，不是必须要实现，当必要时就需要创建
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: LottieLocalView

        init(_ animationView: LottieLocalView) {
            self.parent = animationView
            super.init()
        }
    }
}

