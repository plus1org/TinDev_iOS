//
//  FriendsListScreenView.swift
//  TinDev
//
//  Created by mttm on 08.07.2023.
//

import SwiftUI

struct FriendsListScreenView: View {
    
    @State private var searchText = ""
    let users = MockUsersData.users
    
    var filteredUsers: [User] {
        return users.filter { user in
            self.searchText.isEmpty ? true : user.name.lowercased().contains(self.searchText.lowercased())
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 26) {
                SearchBarView(text: $searchText,
                              placeholder: Localizable.FriendsListScreenModule.search)
                
                Button(action: {}) {
                    HStack(spacing: 8) {
                        CircleImageView(imageName: "person1")
                            .frame(width: 38, height: 38)
                            .padding(.leading, 16)
                        Text(Localizable.FriendsListScreenModule.friendRequestsButton)
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Text("10")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .background(Capsule().fill(Color.blue))
                            .padding(.trailing, 16)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .background(Pallete.customGray)
                    .cornerRadius(12)
                    .padding(.horizontal, 16)
                }
            }
            UserScrollView(users: filteredUsers)
                .padding(.bottom, 28)
        }
        .navigationTitle("\(Localizable.FriendsListScreenModule.friendsCounter) (\(users.count))")
        .hideKeyboard()
    }
}

struct FriendsListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListScreenView()
    }
}
