//
//  FriendsRequestScreenView.swift
//  TinDev
//
//  Created by mttm on 10.07.2023.
//

import SwiftUI

struct FriendsRequestScreenView: View {
    
    let users = MockUsersData.users
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(users.prefix(4), id: \.id) { user in
                    FriendRequestPreviewView(user: user)
                }
            }
        }
        .padding(.vertical, 20)
        .navigationTitle("\(Localizable.FriendsRequestScreenModule.requestsCounter) (\(users.count))")
    }
}

struct FriendsRequestScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsRequestScreenView()
    }
}
