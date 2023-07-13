//
//  FriendRequestPreviewView.swift
//  TinDev
//
//  Created by mttm on 10.07.2023.
//

import SwiftUI

struct FriendRequestPreviewView: View {
    var user: User
    @Binding var selectedUserId: String?
    @Binding var showMenu: Bool
    @Binding var menuPosition: CGPoint
    
    var body: some View {
        HStack(spacing: 15) {
            CircleImageView(imageName: user.imageName)
                .frame(width: 90, height: 90)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(user.name)
                        .font(.headline)
                    
                    Spacer()
                    
                    GeometryReader { geometry in
                        Button(action: {
                            withAnimation {
                                self.menuPosition = geometry.frame(in: .global).origin
                                self.menuPosition.x += geometry.size.width
                                self.selectedUserId = user.id.uuidString
                                self.showMenu = true
                            }
                        }) {
                            Image(systemName: Images.ellipsis)
                                .foregroundColor(Pallete.customBlack)
                                .padding(.bottom, 10)
                                .contentShape(Rectangle())
                        }
                    }
                    .frame(width: 18, height: 4)
                    
                }
                HStack {
                    Text(user.message)
                        .font(Fonts.regular15)
                        .foregroundColor(Pallete.customDarkGray)
                        .lineLimit(1)
                    Spacer()
                    Button {} label: {
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
    @State static var selectedUserId: String? = nil
    @State static var showMenu = false
    @State static var menuPosition = CGPoint.zero
    
    static var previews: some View {
        FriendRequestPreviewView(user: MockUsersData.users[3], selectedUserId: $selectedUserId, showMenu: $showMenu, menuPosition: $menuPosition)
    }
}
