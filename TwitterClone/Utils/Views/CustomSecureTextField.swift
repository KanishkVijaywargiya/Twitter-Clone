//
//  CustomSecureTextField.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 02/07/21.
//

import SwiftUI

struct CustomSecureTextField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}

struct CustomSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureTextField(text: .constant(""), placeholder: Text("Email"))
    }
}
