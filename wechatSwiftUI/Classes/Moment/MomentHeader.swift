//
//  MomentHeader.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/16.
//

import SwiftUI

struct MomentHeader: View {
    var body: some View {
        ZStack {
            Image("moment_bg")
                .resizable()
                .frame(height: 300)
                .scaledToFit()
                .padding(.bottom, 40)
            
            VStack(content: {
                Spacer()
                HStack(alignment: .top, spacing: 10) {
                    Spacer()
                    Text("Mihayo")
                        .foregroundColor(.primary)
                        .font(.system(size: 16, weight: .bold))
                        .padding(.top, 10)
                    
                    Image("data_avatar10")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(6)
                }
                .padding(.bottom, 20)
            })
            .padding(.trailing, 20)
        }
        .background(.white)
    }
}

struct MomentHeader_Previews: PreviewProvider {
    static var previews: some View {
        MomentHeader()
    }
}
