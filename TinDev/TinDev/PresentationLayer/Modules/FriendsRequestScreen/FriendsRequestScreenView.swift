//
//  FriendsRequestScreenView.swift
//  TinDev
//
//  Created by mttm on 10.07.2023.
//

import SwiftUI

struct FriendsRequestScreenView: View {
    
    let users = MockUsersData.users
    @State private var showMenu = false
    @State private var selectedUserId: String?
    @State private var menuPosition = CGPoint.zero
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(users.prefix(4), id: \.id) { user in
                        FriendRequestPreviewView(user: user,
                                                 selectedUserId: $selectedUserId,
                                                 showMenu: $showMenu,
                                                 menuPosition: $menuPosition)
                    }
                }
            }
            .padding(.vertical, 20)
            .navigationTitle("\(Localizable.FriendsRequestScreenModule.requestsCounter) (\(users.count))")
            
            if showMenu {
                MenuPopupView(isPresented: $showMenu,
                              buttons: [
                                ButtonContent(text: Localizable.FriendsRequestScreenModule.reportSpam,
                                              action: {})
                              ],
                              menuPosition: menuPosition)
            }
        }
    }
}

struct FriendsRequestScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsRequestScreenView()
    }
}
