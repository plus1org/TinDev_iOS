//
//  UserPreviewView.swift
//  TinDev
//
//  Created by mttm on 07.07.2023.
//

import SwiftUI

struct UserPreviewView: View {
   
    var user: User

    var body: some View {
        HStack {
            CircleImageView(imageName: user.imageName)
                .frame(width: 38, height: 38)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.headline)
                Text(user.isOnline ? Localizable.UserPreviewModule.userIsOnline : Localizable.UserPreviewModule.userIsOffline)
                    .font(Fonts.regular14)
                    .foregroundColor(user.isOnline ? .blue : Pallete.customDarkGray)
            }
            Spacer()
        }
        .padding(.top, 16)
        .padding(.leading, 16)
    }
}

struct UserPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        UserPreviewView(user: MockUsersData.users[0])
    }
}
