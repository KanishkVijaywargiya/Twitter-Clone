//
//  SplashView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 20/06/21.
//

import SwiftUI

struct SplashView: View {
    let color: UIColor = UIColor(red: 29/255.0, green: 161/255.0, blue: 242/255.0, alpha: 1)
    @Binding var animate: Bool
    @Binding var showSplash: Bool
    
    var body: some View {
        ZStack {
            Color(color)
            Image("twitter")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 85, height: 85)
                .scaleEffect(animate ? 50 : 1)
                .animation(Animation.easeIn(duration: 0.7))
        }
        .ignoresSafeArea()
        .animation(Animation.linear(duration: 0.5))
        .opacity(showSplash ? 1 : 0)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(animate: .constant(false), showSplash: .constant(false))
    }
}
