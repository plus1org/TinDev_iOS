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
                Text("\(MockUsersData.users.count) \(Localizable.EventChatInfoScreenModule.usersCounter)")
                    .font(Fonts.regular15)
                    .foregroundColor(Pallete.customDarkGray)
            }
            .padding(.top, 12)
            VStack {
                FlatButton(action: {},
                            title: Localizable.EventChatInfoScreenModule.inviteButton,
                            disabled: false,
                            font: Fonts.regular14,
                            frameMaxWidth: .infinity,
                            foregroundColor: Pallete.customWhite,
                            backgroundColor: Pallete.mainColor,
                            imageName: Images.personBadgePlus)
                .padding(.top, 20)
            }
            
            UserScrollView(users: MockUsersData.users)
                .padding(.vertical, 28)
            
            SolidButton(action: {},
                        title: Localizable.EventChatInfoScreenModule.leaveChatButton,
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
