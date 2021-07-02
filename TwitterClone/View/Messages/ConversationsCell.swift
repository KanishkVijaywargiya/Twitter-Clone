//
//  ConversationsCell.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 17/06/21.
//

import SwiftUI

struct ConversationsCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("venom")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("venom")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Longer message text to see what happens when I do this!")
                        .font(.system(size: 15))
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .padding(.trailing)
            }
            
            Divider()
        }
    }
}

struct ConversationsCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsCell()
    }
}
