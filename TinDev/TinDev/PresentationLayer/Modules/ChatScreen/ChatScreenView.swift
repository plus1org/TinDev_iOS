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
            ZStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        TabBarModifier.showTabBar()
                    }) {
                        HStack {
                            Image(systemName: Images.arrowBack)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 20)
                        }
                        .foregroundColor(Pallete.customBlack)
                    }
                    .padding()
                    Spacer()
                }
                Text(chat.personName)
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
            }
            if !chat.isConfirmed {
                Text(Localizable.ChatModule.userIsNotConfirmed)
                    .foregroundColor(Pallete.customRed)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
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
            .keyboardAvoiding()
            .padding(.bottom, 33)
            .padding(.horizontal, 10)
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
        .hideKeyboard()
        .hideTabBar()
        .gesture(
            DragGesture(minimumDistance: 45, coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.width > 0 {
                        self.presentationMode.wrappedValue.dismiss()
                        TabBarModifier.showTabBar()
                    }
                }
        )
    }
}

struct ChatView_Previews: PreviewProvider {
    static var chat = Chat(
        isConfirmed: false, isMutted: true, personImage: "person",
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
