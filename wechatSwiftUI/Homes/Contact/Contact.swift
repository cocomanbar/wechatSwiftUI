//
//  Contact.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct Contact: View {
    var body: some View {
        NavigationView {
            ContactList()
                .navigationTitle(TabBarItemDatable.contact.title)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Trailing())
                .onAppear(perform: viewAppear)
                .onDisappear(perform: viewDisappear)
        }
    }
    
    func viewAppear() {
        
    }
    
    func viewDisappear() {
        
    }
}

private struct Trailing: View {
    
    @State private var isPressented: Bool = false
    
    var body: some View {
        Button {
            isPressented = true
        } label: {
            Image(systemName: "person.wave.2.fill")
                .resizable()
                .foregroundColor(.primary)
        }
    }
}

struct Contact_Previews: PreviewProvider {
    static var previews: some View {
        Contact()
    }
}
