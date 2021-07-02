//
//  SearchView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 15/06/21.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack { Spacer() }
                    NavigationLink(destination: UserProfileView()) {
                        UserCell()
                    }
                }
            }.padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
