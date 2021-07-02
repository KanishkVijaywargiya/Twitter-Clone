//
//  SideMenuOptionView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 24/06/21.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 25)
            
            Text(viewModel.title)
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .profile)
    }
}
