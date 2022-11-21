//
//  TestRoom.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/19.
//

import SwiftUI

struct TestRoom: View {
    
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
        list = TestModel.swiftDisplayModels
    }
    
    private func jumpDirection(_ model: TestModel) -> AnyView {
        var view: AnyView
        switch model.title {
        case TestModel.State:
            view = AnyView(TestRoomState(title: model.title))
        case TestModel.Binding:
            view = AnyView(TestRoomBinding(title: model.title))
        case TestModel.Published:
            view = AnyView(TestRoomPublish(title: model.title))
        case TestModel.GeometryReader:
            view = AnyView(TestRoomGeometryReader(title: model.title))
            
        default :
            view = AnyView(TestRoomState())
        }
        return view
    }
}

struct TestRow: View {
    var model: TestModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let title = model.title, !title.isEmpty {
                Text(title)
                    .lineLimit(Int.max)
                    .foregroundColor(.primary)
                    .font(.system(size: 16, weight: .heavy))
                    .padding(.bottom, 3)
                    .multilineTextAlignment(.leading)
            }
            if let description = model.description, !description.isEmpty {
                Text(description)
                    .lineLimit(Int.max)
                    .foregroundColor(.secondary)
                    .font(.system(size: 14, weight: .regular))
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
    }
}

struct TestRoom_Previews: PreviewProvider {
    static var previews: some View {
        TestRoom()
    }
}

/// 数据

struct TestModel: Identifiable {
    var id: String
    var title: String
    var description: String
}


extension TestModel: Modelable {
    typealias Model = TestModel
    
    static var swiftDisplayModel: TestModel {
        TestModel(id: "1", title: "@State", description: "关于 @State 的例子")
    }
    
    static var swiftDisplayModels: [TestModel] {
        [
            TestModel(id: "1", title: TestModel.State, description: "关于\n \(TestModel.State) \n的例子"),
            TestModel(id: "2", title: TestModel.Binding, description: "关于\n \(TestModel.Binding) \n的例子"),
            TestModel(id: "3", title: TestModel.Published, description: "关于\n \(TestModel.Published) \(TestModel.ObservableObject) \(TestModel.ObservedObject) \n的例子"),
            TestModel(id: "4", title: TestModel.GeometryReader, description: "关于\n \(TestModel.GeometryReader) \n的例子"),
            
        ]
    }
}

extension TestModel {
    
    static let State = "@State"
    static let Binding = "@Binding"
    
    static let Published = "@Published"
    static let ObservableObject = "@ObservableObject"
    static let ObservedObject = "@ObservedObject"
    
    static let Environment = "@Environment"
    static let EnvironmentObject = "@EnvironmentObject"
    
    
    static let GeometryReader = "GeometryReader"
}

