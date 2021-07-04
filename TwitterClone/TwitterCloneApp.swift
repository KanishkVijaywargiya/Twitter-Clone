//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 15/06/21.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    @State var animate: Bool = false
    @State var showSplash: Bool = true
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView().environmentObject(AuthViewModel())
                
                // splash screen
                SplashView(animate: $animate, showSplash: $showSplash)
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    animate.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showSplash.toggle()
                }
            }
        }
    }
}
