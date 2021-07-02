//
//  UserProfileView.swift
//  TwitterClone
//
//  Created by KANISHK VIJAYWARGIYA on 23/06/21.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ProfileHeaderView().padding()
                
                FilterButtonView(selectedOption: $selectedFilter).padding()
                
                ForEach(0..<5) { tweet in
                    TweetCell().padding()
                }
            }
            .navigationTitle("batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
