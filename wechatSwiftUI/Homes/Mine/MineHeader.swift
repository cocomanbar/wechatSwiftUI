//
//  MineHeader.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/15.
//

import SwiftUI

struct MineHeader: View {
    var body: some View {
        HStack(alignment: .center) {
            LeftArrowView()
            Spacer()
            RightArrowView()
        }
        .background(.white)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
}

struct MineHeader_Previews: PreviewProvider {
    static var previews: some View {
        MineHeader()
    }
}

struct RightArrowView: View {
    var body: some View {
        HStack {
            Image("me_qrcode")
                .resizable()
                .frame(width: 20, height: 20)
            Image("cell_detail_indicator")
                .resizable()
                .frame(width: 14, height: 18)
                .padding(.leading, 10)
        }
    }
}

struct LeftArrowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 18) {
            Image("data_avatar10")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(6)
            
            UserInfoView()
        }
    }
}

struct UserInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text("无敌风火轮")
                .foregroundColor(.primary)
                .font(.system(size: 16, weight: .medium))
            
            Text("微信号：love125800")
                .foregroundColor(.secondary)
                .font(.system(size: 14, weight: .regular))
            
            UserStateView()
        }
    }
}

struct UserStateView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("+ 状态")
                .padding(EdgeInsets(top: 3, leading: 6, bottom: 3, trailing: 6))
                .foregroundColor(.secondary)
                .font(.system(size: 13, weight: .regular))
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .stroke(Color.secondary, lineWidth: 0.5)
                )
            
            Image(systemName: "ellipsis.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("me_dot_color"))
        }
    }
}


