//
//  MineList.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/15.
//

import SwiftUI

struct MineList: View {
    
    @ObservedObject var viewModel: MineViewModel = MineViewModel()
    
    var body: some View {
        ScrollView {
            ScrollView {
                LazyVStack(spacing: 0) {
                    Section {
                        SpaceHolder(color: .white)
                            .frame(height: 500)
                        MineHeader()
                        SpaceHolder()
                            .frame(height: 8)
                    }
                    .background(.white)
                    
                    ForEach(viewModel.list) { listModel in
                        Section {
                            ForEach(listModel.rows ?? []) { row in
                                wrapLink(model: row)
                                Separator()
                                    .padding(.leading, 76)
                            }
                        }
                        SpaceHolder()
                            .frame(height: 8)
                    }
                }
            }
            .offset(x: 0, y: -450)
        }
        .background(Color("separator"))
//        .fixedSize(horizontal: false, vertical: true)
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
        case "":
            item = AnyView(Game())
            break
        default :
            item = AnyView(Game())
        }
        return item
    }
}

struct MineList_Previews: PreviewProvider {
    static var previews: some View {
        MineList()
    }
}
