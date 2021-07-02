//
//  FeedView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 15/06/21.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView = false
    @Binding var showSideBar: Bool
    
    var body: some View {
        ZStack {
            if showSideBar {
                SideMenuView(isShowing: $showSideBar)
            }
            
            ZStack(alignment: .bottomTrailing) {
                Color(.white)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(0..<8) { _ in
                            TweetCell()
                        }
                    }
                    .padding()
                }
                
                Button(action: {self.isShowingNewTweetView.toggle()}) {
                    Image("Tweet")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 32, height: 32)
                        .padding()
                }
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $isShowingNewTweetView){
                    NewTweetsView()
                }
            }
            .cornerRadius(showSideBar ? 20 : 10)
            .offset(x: showSideBar ? 300 : 0, y: showSideBar ? 44 : 0)
            .scaleEffect(showSideBar ? 0.8 : 1.0)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(showSideBar: .constant(false))
    }
}
