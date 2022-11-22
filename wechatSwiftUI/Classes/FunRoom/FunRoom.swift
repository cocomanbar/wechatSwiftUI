//
//  FunRoom.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/20.
//

import SwiftUI

struct FunRoom: View {
    
    @State private var list: [TestModel] = []
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 5) {
                ForEach(list) { model in
                    NavigationLink {
                        jumpDirection(model)
                    } label: {
                        TestRow(model: model)
                    }
                    Separator()
                }
            }
        }
        .hiddenTabBar()
        .onAppear(perform: viewAppear)
    }
    
    private func viewAppear() {
        list = TestModel.swiftDisplayModels2
    }
    
    private func jumpDirection(_ model: TestModel) -> AnyView {
        var view: AnyView
        switch model.title {
        case TestModel.Language:
            view = AnyView(FunRoomLocalization(title: model.title))
        case TestModel.Lottie:
            view = AnyView(FunRoomLottie(title: model.title))
        case TestModel.AnimationSpring:
            view = AnyView(FunRoomAnimationSpring(title: model.title))
            
            
        default :
            view = AnyView(TestRoomState())
        }
        return view
    }
}

struct FunRoom_Previews: PreviewProvider {
    static var previews: some View {
        FunRoom()
    }
}

/// 数据

extension TestModel {
    
    static var swiftDisplayModels2: [TestModel] {
        [
            TestModel(id: "1", title: TestModel.Language, description: "关于\n \(TestModel.Language) 多语言环境切换 \n的例子"),
            TestModel(id: "2", title: TestModel.Lottie, description: "关于\n \(TestModel.Lottie) 动画 \n的例子"),
            TestModel(id: "3", title: TestModel.AnimationSpring, description: "关于\n \(TestModel.AnimationSpring) 动画 \n的例子"),
        ]
    }
}

extension TestModel {
    
    static let Language = "Language"
    static let Lottie = "Lottie"
    static let AnimationSpring = "Animation"
}

