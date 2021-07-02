//
//  MainTabView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 20/06/21.
//

import SwiftUI

struct MainTabView: View {
    @Binding var selectedIndex: Int
    @State var showSideBar = false
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView(selection: $selectedIndex) {
                    FeedView(showSideBar: $showSideBar)
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }.tag(0)
                    
                    SearchView()
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }.tag(1)
                    
                    ConversationsView()
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "message")
                            Text("Message")
                        }.tag(2)
                }
                .accentColor(Color(.systemTeal))
                .navigationBarTitle(tabTitle, displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        withAnimation(.spring()) {
                            self.showSideBar.toggle()
                        }
                    }) {
                        Image(sideButton ? "batman" : "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }.disabled(sideButton ? false : true)
                )
            }
            .onAppear(perform: {
                showSideBar = false
            })
            .navigationBarHidden(showSideBar ? true : false)
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Search"
        case 2: return "Message"
        default: return ""
        }
    }
    
    var sideButton: Bool {
        switch selectedIndex {
        case 0: return true
        case 1: return false
        case 2: return false
        default: return false
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(selectedIndex: .constant(0))
    }
}
