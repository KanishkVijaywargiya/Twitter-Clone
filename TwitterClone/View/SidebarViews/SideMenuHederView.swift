//
//  SideMenuHederView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 24/06/21.
//

import SwiftUI

struct SideMenuHederView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {
                withAnimation(.spring()) {
                    self.isShowing.toggle()
                }
            }) {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            }
            
            VStack(alignment: .leading) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("Bruce Wayne")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("@batman")
                    .font(.system(size: 14))
                    .padding(.bottom, 24)
                
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Text("26").bold()
                        Text("Following")
                    }
                    
                    HStack(spacing: 4) {
                        Text("1,254").bold()
                        Text("Followers")
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }.padding()
        }
    }
}

struct SideMenuHederView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHederView(isShowing: .constant(false))
    }
}
