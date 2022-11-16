//
//  ContactSectionHeader.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import SwiftUI

struct ContactSectionHeader: View {
    
    let letter: String
    
    init(letter: String) {
        self.letter = letter
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color("light_gray")
                .frame(maxWidth: .infinity)
            
            Text(letter)
                .foregroundColor(.secondary)
                .font(.system(size: 14, weight: .medium))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
        }
    }
}

struct ContactSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        ContactSectionHeader(letter: "A")
    }
}
