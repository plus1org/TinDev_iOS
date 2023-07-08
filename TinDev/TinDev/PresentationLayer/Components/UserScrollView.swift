//
//  UserScrollView.swift
//  TinDev
//
//  Created by mttm on 08.07.2023.
//

import SwiftUI

struct UserScrollView: View {
    
    var users: [User]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(users) { user in
                    UserPreviewView(user: user)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(Pallete.customGray)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 16)
    }
}

struct UserScrollView_Previews: PreviewProvider {
    static var previews: some View {
        UserScrollView(users: MockUsersData.users)
    }
}

