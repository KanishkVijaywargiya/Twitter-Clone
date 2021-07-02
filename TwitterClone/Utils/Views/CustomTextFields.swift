//
//  CustomTextFields.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 02/07/21.
//

import SwiftUI

struct CustomTextFields: View {
    @Binding var text: String
    let placeholder: Text
    let image: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}

struct CustomTextFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFields(text: .constant(""), placeholder: Text("Email"), image: "email")
    }
}
