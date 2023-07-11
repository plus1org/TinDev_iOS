//
//  ChatScreenView.swift
//  TinDev
//
//  Created by mttm on 19.06.2023.
//

import SwiftUI

struct ChatView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var messageText = ""
    
    var chat: Chat
    
    var body: some View {
        VStack {
            if !chat.isConfirmed {
                Text(Localizable.ChatModule.userIsNotConfirmed)
                    .foregroundColor(Pallete.customRed)
                    .font(Fonts.regular14)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            ScrollView {
                Text("19 июня 2023 г.")
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .foregroundColor(Pallete.customDarkGray)
                ForEach(chat.messages) { message in
                    HStack {
                        if message.isUserMessage {
                            Spacer()
                            Text(message.text)
                                .padding()
                                .background(Pallete.customGray)
                                .foregroundColor(Pallete.customBlack)
                                .cornerRadius(18)
                        } else {
                            Text(message.text)
                                .padding()
                                .background(Pallete.mainColor)
                                .foregroundColor(Pallete.customWhite)
                                .cornerRadius(18)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            Divider()
            ZStack {
                TextField(Localizable.ChatModule.message, text: $messageText)
                    .frame(height: 40)
                    .padding(.horizontal, 12)
                    .background(Pallete.customGray)
                    .cornerRadius(20)
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text(Localizable.ChatModule.sendButton)
                            .foregroundColor(Pallete.mainColor)
                    }
                    .padding(.trailing, 12)
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .navigationTitle(chat.personName)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: FriendsRequestScreenView()) {
                    Image(systemName: Images.ellipsis)
                        .frame(width: 23, height: 5)
                        .foregroundColor(Pallete.customBlack)
                        .padding(10)
                        .contentShape(Rectangle())
                }
            }
        }
        .hideKeyboard()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: MockChatData.chats[0])
    }
}
