//
//  EventChatInfoScreenView.swift
//  TinDev
//
//  Created by mttm on 07.07.2023.
//

import SwiftUI

struct EventChatInfoScreenView: View {
    
    var users = MockUsersData.users
    
    var body: some View {
        VStack {
            VStack(spacing: 4) {
                CircleImageView(imageName: "guys")
                    .frame(width: 120, height: 120)
                Text("Прогулка")
                    .font(.title2).bold()
                Text("\(MockUsersData.users.count) \(Localizable.EventChatInfoScreenModile.usersCounter)")
                    .font(Fonts.regular15)
                    .foregroundColor(Pallete.customDarkGray)
            }
            .padding(.top, 12)
            VStack {
                SmallButton(action: {},
                            title: Localizable.EventChatInfoScreenModile.inviteButton,
                            disabled: false,
                            font: Fonts.regular14,
                            frameMaxWidth: .infinity,
                            foregroundColor: Pallete.customWhite,
                            backgroundColor: Pallete.mainColor,
                            imageName: "person.badge.plus")
                .padding(.top, 20)
            }
            
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
            .padding(.vertical, 28)
            .padding(.horizontal, 16)
            
            SolidButton(action: {},
                        title: Localizable.EventChatInfoScreenModile.leaveChatButton,
                        disabled: false,
                        font: Fonts.regular16,
                        frameMaxWidth: .infinity,
                        foregroundColor: Pallete.customWhite,
                        backgroundColor: Pallete.customRed)
        }
    }
}


struct EventChatInfoScreenView_Previews: PreviewProvider {
    static var previews: some View {
        EventChatInfoScreenView()
    }
}
