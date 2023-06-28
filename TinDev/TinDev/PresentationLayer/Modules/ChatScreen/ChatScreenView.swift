//
//  ChatScreenView.swift
//  TinDev
//
//  Created by mttm on 19.06.2023.
//

import SwiftUI

struct ChatView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var chat: Chat
    
    @State private var messageText = ""
    
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
                        .font(Fonts.regular12)
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
                HStack {
                    VStack {
                        TextField(Localizable.ChatModule.message, text: $messageText)
                            .frame(height: 40)
                            .padding(.horizontal, 12)
                            .background(Pallete.customGray)
                            .cornerRadius(20)
                    }
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text(Localizable.ChatModule.sendButton)
                                    .foregroundColor(Pallete.mainColor)
                            }
                            .padding(.trailing, 12)
                        }
                    )
                }
                .padding(10)
            }
            .navigationBarTitle(Text(chat.personName), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(Pallete.customBlack)
            })
        .hideKeyboard()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var chat = Chat(
        isConfirmed: false, personImage: "person",
        personName: "Игорь Немцов",
        messageDate: "15 июн",
        messages: [
            Message(text: "Привет, как дела?", isUserMessage: false),
            Message(text: "Привет, все отлично!", isUserMessage: true),
            Message(text: "Договорились, тогда я буду рассчитывать на тебя", isUserMessage: false)
        ]
    )
    
    static var previews: some View {
        ChatView(chat: chat)
    }
}
