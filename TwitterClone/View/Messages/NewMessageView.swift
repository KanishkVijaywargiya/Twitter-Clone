//
//  NewMessageView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 23/06/21.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack { Spacer() }
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                    }) {
                        UserCell()
                    }
                }
            }.padding(.leading)
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
