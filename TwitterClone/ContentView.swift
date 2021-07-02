//
//  ContentView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 15/06/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @State var animate: Bool = false
    @State var showSplash: Bool = true
    
    var body: some View {
        VStack {
            ZStack {
                // main tab view
                ZStack {
                    MainTabView(selectedIndex: $selectedIndex)
                }
                
                // splash screen
                SplashView(animate: $animate, showSplash: $showSplash)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animate.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showSplash.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
