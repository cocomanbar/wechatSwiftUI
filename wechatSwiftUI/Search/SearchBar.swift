//
//  SearchBar.swift
//  wechatSwiftUI
//
//  Created by tanxl on 2022/11/12.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var isSearchPressented: Bool = false
    
    var body: some View {
        Button {
            self.isSearchPressented.toggle()
        } label: {
            VStack  {
                Spacer()
                HStack(spacing: 4){
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundColor(.secondary)
                        .frame(width: 13, height: 13)
                    Text("搜索")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.secondary)
                    Spacer()
                }
                Spacer()
            }
            .background(Color("search_corner_background"))
            .cornerRadius(6)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .background(Color("light_gray"))
        .sheet(isPresented: $isSearchPressented) {
            Search()
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar().previewLayout(.fixed(width: 414, height: 44))
    }
}
