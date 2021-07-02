//
//  MessageInputView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 17/06/21.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var mesageText: String
    
    var body: some View {
        HStack {
            TextField("Type a message...", text: $mesageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: {}) {
                Text("Send")
            }
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        
        MessageInputView(mesageText: .constant("Type a message..."))
    }
}
