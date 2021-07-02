//
//  ConversationsView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 17/06/21.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(destination: ChatView(), isActive: $showChat){}
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(0..<8) { _ in
                        NavigationLink(destination: ChatView()) {
                            ConversationsCell()
                        }
                    }
                }.padding()
            }
            
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }) {
                Image(systemName: "message")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .sheet(isPresented: $isShowingNewMessageView){
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
