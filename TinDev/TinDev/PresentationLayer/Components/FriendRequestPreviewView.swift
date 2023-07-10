//
//  FriendRequestPreviewView.swift
//  TinDev
//
//  Created by mttm on 10.07.2023.
//

import SwiftUI

struct FriendRequestPreviewView: View {
    
    var user: User
    
    var body: some View {
        HStack(spacing: 15) {
            CircleImageView(imageName: user.imageName)
                .frame(width: 90, height: 90)
            VStack {
                HStack {
                    Text(user.name)
                        .font(.headline)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: Images.ellipsis)
                            .frame(width: 18, height: 4)
                            .foregroundColor(Pallete.customBlack)
                            .padding(.vertical , 10)
                            .contentShape(Rectangle())
                    }
                }
                HStack {
                    Text(user.message)
                        .font(Fonts.regular15)
                        .foregroundColor(Pallete.customDarkGray)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {}) {
                        Text(Localizable.FriendRequestPreviewModule.readAllButton)
                            .font(Fonts.regular15)
                            .foregroundColor(Pallete.customBlue)
                    }
                }
                HStack(spacing: 8) {
                        SmallButton(action: {},
                                    title: Localizable.FriendRequestPreviewModule.acceptButton,
                                    disabled: false,
                                    font: Fonts.regular13,
                                    frameMaxWidth: 96,
                                    foregroundColor: Pallete.customWhite,
                                    backgroundColor: Pallete.mainColor
                        )
                        SmallButton(action: {},
                                    title: Localizable.FriendRequestPreviewModule.denyButton,
                                    disabled: false,
                                    font: Fonts.regular13,
                                    frameMaxWidth: 96,
                                    foregroundColor: Pallete.customBlack,
                                    backgroundColor: Pallete.customGray)
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct FriendRequestPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRequestPreviewView(user: MockUsersData.users[0])
    }
}
