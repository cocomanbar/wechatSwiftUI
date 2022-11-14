//
//  LottieLocalView.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import Foundation
import SwiftUI
import Lottie

//struct LottieView: UIViewRepresentable {
//
//    typealias UIViewType = LottieAnimationView
//
//    private lazy var animationView = LottieAnimationView()
//
//    var name: String
//    @Binding var play: Int
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
//        let view = UIView()
//
//        animationView.contentMode = .scaleAspectFit
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(animationView)
//
//        NSLayoutConstraint.activate([
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
//        ])
//    }
//
//    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
//        animationView.stop()
//        animationView.play()
//    }
//
//    class Coordinator: NSObject {
//        var parent: LottieView
//
//        init(_ animationView: LottieView) {
//            self.parent = animationView
//            super.init()
//        }
//    }
//}
