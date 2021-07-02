//
//  NewTweetsView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 23/06/21.
//

import SwiftUI

struct NewTweetsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var captionText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                    TextArea("What's happening?", text: $captionText)
                    
                    Spacer()
                }.padding()
                .navigationBarItems(
                    leading: Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("cancel")
                            .foregroundColor(.blue)
                    },
                    trailing: Button(action: {}) {
                        Text("Tweet")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                    }.clipShape(Capsule())
                )
                Spacer()
            }
        }
    }
}

struct NewTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetsView()
    }
}
