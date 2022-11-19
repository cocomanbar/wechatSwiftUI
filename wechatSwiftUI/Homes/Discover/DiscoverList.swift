//
//  DiscoverList.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/14.
//

import SwiftUI

struct DiscoverList: View {
    
    @ObservedObject var viewModel: DiscoverViewModel = DiscoverViewModel()
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.list) { listModel in
                    Group {
                        ForEach(listModel.rows ?? []) { model in
                            wrapLink(model: model)
                            Separator()
                        }
                    }
                    SpaceHolder()
                        .frame(height: 8)
                }
            }
        }
        .background(Color("separator"))
        .onAppear(perform: viewAppear)
    }
    
    func viewAppear() {
        
    }
    
    // 包装解决cell 右边箭头 → 问题
    func wrapLink(model: DiscoverItemModel) -> some View {
        NavigationLink(destination: model.detailView) {
            DiscoverRow(rowData: model)
                .background(.white)
        }
    }
}

extension DiscoverItemModel {
    fileprivate var detailView: AnyView {
        var item: AnyView
        switch id {
        case "10":
            item = AnyView(Moment())
        case "80":
            item = AnyView(TestRoom())
        default :
            item = AnyView(Game())
        }
        return item
    }
}

struct DiscoverList_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverList()
    }
}
