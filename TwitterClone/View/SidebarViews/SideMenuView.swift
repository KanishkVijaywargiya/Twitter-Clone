//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 24/06/21.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                SideMenuHederView(isShowing: $isShowing)
                    .foregroundColor(.white)
                    .frame(height: 240)
                
                //                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                //                    NavigationLink(destination: Text(option.title)) {
                //                        SideMenuOptionView(viewModel: option)
                //                    }
                //                }
                NavigationLink(destination: UserProfileView()) {
                    SidebarViews(image: "person", title: "Profile")
                }
                
                SidebarViews(image: "arrow.left.square", title: "Logout")
                    .onTapGesture {
                        print("Logout user")
                    }
                
                Spacer()
            }
        }
    }
}

struct SidebarViews: View {
    let image: String
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: image)
                .frame(width: 24, height: 25)
            
            Text(title)
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
