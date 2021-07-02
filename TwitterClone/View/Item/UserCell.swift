//
//  UserCell.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 17/06/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("spiderman")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("spiderman")
                    .font(.system(size: 14, weight: .semibold))
                Text("Peter parker")
                    .font(.system(size: 14))
            }.foregroundColor(.black)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
