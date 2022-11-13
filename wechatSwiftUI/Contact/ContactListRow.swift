//
//  ContactListRow.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import SwiftUI

struct ContactListRow: View {
    
    let contactModel: ContactModel
    
    init(contactModel: ContactModel) {
        self.contactModel = contactModel
    }
    
    var body: some View {
        HStack(spacing: 12) {
            
            Image(contactModel.user_info?.avatar ?? "")
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(4)
            
            Text(contactModel.user_info?.user_name ?? "")
                .foregroundColor(.primary)
                .font(.system(size: 16, weight: .regular))
        }
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
    }
}

struct ContactListRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactListRow(contactModel: ContactModel.swiftDisplayModel)
    }
}
