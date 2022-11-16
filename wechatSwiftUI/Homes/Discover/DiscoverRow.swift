//
//  DiscoverRow.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/14.
//

import SwiftUI

struct DiscoverRow: View {
    
    var rowData: DiscoverItemModel
    
    init(rowData: DiscoverItemModel) {
        self.rowData = rowData
    }
    
    var body: some View {
        HStack (alignment: .center) {
            HStack {
                if let icon = rowData.icon {
                    Image(icon)
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                if let title = rowData.title {
                    Text(title)
                        .foregroundColor(.primary)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.leading, 2)
                }
            }
            Spacer()
            HStack {
                if let right_icon = rowData.right_icon, right_icon.count > 0 {
                    ZStack {
                        Image(right_icon)
                            .resizable()
                            .cornerRadius(4)
                            .frame(width: 28, height: 28)
                        Dot()
                            .offset(x: 14, y: -14)
                            .frame(width: 7, height: 7)
                    }
                    .padding(.trailing, 10)
                }
                Image("cell_detail_indicator")
                    .resizable()
                    .frame(width: 14, height: 18)
            }
        }
        .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
    }
}

struct DiscoverRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRow(rowData: DiscoverItemModel.swiftDisplayModel)
    }
}
