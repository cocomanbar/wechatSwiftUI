//
//  ChatRow.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct ChatRow: View {
    
    let model: ChatModel
    
    var body: some View {
        
        HStack(spacing: 12) {
            Image(model.avatar ?? "")
                .renderingMode(.original)
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .top) {
                    Text(model.user_name ?? "")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.primary)
                    Spacer()
                    Text(model.time ?? "")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.secondary)
                }
                Text(model.content ?? "")
                    .lineLimit(1)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.secondary)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(model: ChatModel.swiftDisplayModel)
    }
}
