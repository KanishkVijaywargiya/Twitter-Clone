//
//  ProfileActionButtonView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 23/06/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    let isCurrentUser: Bool

    var body: some View {
        if isCurrentUser {
            Button(action: {}) {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }.clipShape(Capsule())
            
        } else {
            HStack {
                Button(action: {}) {
                    Text("Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }.clipShape(Capsule())
                
                Button(action: {}) {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                }.clipShape(Capsule())
            }
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView(isCurrentUser: false)
    }
}
