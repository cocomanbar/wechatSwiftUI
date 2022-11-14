//
//  ContactList.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/13.
//

import SwiftUI

struct ContactList: View {
    
    @ObservedObject var viewModel = ContactViewModel()
    
    var body: some View {
        ZStack {
            Text("加载中..")
                .opacity(viewModel.contactList.count > 0 ? 0: 1)
            
            List() {
                Group {
                    Section {
                        if viewModel.contactList.count > 0 {
                            SearchBar()
                            wrapNavigationLink(contact: ContactModel.newfriends)
                            wrapNavigationLink(contact: ContactModel.chatroom)
                            wrapNavigationLink(contact: ContactModel.chatsign)
                        }
                    }

                    ForEach(viewModel.contactList) { contact in
                        Section.init(header: ContactSectionHeader(letter: contact.letter ?? "")) {
                            ForEach(contact.rows ?? []) { contactModel in
                                wrapNavigationLink(contact: contactModel)
                            }
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listSectionSeparator(.hidden)
            }
            .id(viewModel.contactList.count)
            .listStyle(.plain)
        }
    }
    
    // 包装解决cell 右边箭头 → 问题
    func wrapNavigationLink(contact: ContactModel) -> some View {
        ZStack(alignment: .leading) {
            NavigationLink(destination: contact.detailView) {
                EmptyView()
            }
            .opacity(0)
            ContactListRow(contactModel: contact)
        }
    }
}

extension ContactModel {
    fileprivate var detailView: AnyView {
        var destination: AnyView
        switch Int(id ?? "0") {
        case 1000001:
            destination = AnyView(ContactFriend())
        case 1000002:
            destination = AnyView(ContactListRoom())
        case 1000003:
            destination = AnyView(ContactFriendTag())
        default :
            destination = AnyView(ContactDetail())
        }
        return destination
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}
