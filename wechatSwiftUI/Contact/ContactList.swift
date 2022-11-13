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
            List {
                Group {
                    Section {
                        if viewModel.contactList.count > 0 {
                            SearchBar()
                        }
                    }
                    ForEach(viewModel.contactList) { contact in
                        Section.init(header: ContactSectionHeader(letter: contact.letter ?? "")) {
                            ForEach(contact.rows ?? []) { contactModel in
                                ZStack(alignment: .leading) {
                                    NavigationLink(destination: ContactDetail()) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    ContactListRow(contactModel: contactModel)
                                }
                            }
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listSectionSeparator(Visibility.hidden)
            }
            .id(viewModel.contactList.count)
            .listStyle(.plain)
            .onAppear(perform: viewAppear)
        }
    }
    
    func viewAppear() {
        
    }
}



struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}
