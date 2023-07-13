//
//  MenuPopupView.swift
//  TinDev
//
//  Created by mttm on 12.07.2023.
//

import SwiftUI

struct ButtonContent {
    let text: String
    let action: () -> Void
}

struct MenuPopupView: View {
    @Binding var isPresented: Bool
    let buttons: [ButtonContent]
    var menuPosition: CGPoint
    
    var body: some View {
        ZStack {
            if isPresented {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.isPresented = false
                    }
            }
            
            if isPresented {
                VStack(alignment: .leading) {
                    Spacer(minLength: 0)
                        .frame(height: 10)
                    ForEach(0..<buttons.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Button(action: self.buttons[index].action) {
                                Text(self.buttons[index].text)
                                    .foregroundColor(.black)
                                    .padding(.top, index == 0 ? 15 : 11)
                                    .padding(.bottom, index == buttons.count - 1 ? 15 : 11)
                                    .padding(.leading, 16)
                            }
                            if index != buttons.count - 1 {
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                    Rectangle()
                        .frame(height: 8)
                        .foregroundColor(Pallete.customDarkGray)
                    Button(action: {
                        self.isPresented = false
                    }) {
                        Text(Localizable.MenuPopupModule.closeButton)
                            .foregroundColor(.red)
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 20)
                    .padding(.leading, 16)
                }
                .frame(width: 250)
                .background(Pallete.customGray)
                .cornerRadius(13)
                .position(x: menuPosition.x - 125, y: menuPosition.y - 13)
            }
        }
    }
}

struct MenuPopupView_Previews: PreviewProvider {
    @State static var isPresented = true
    
    static var previews: some View {
        MenuPopupView(isPresented: $isPresented, buttons: [
            ButtonContent(text: "Кнопка 1", action: {}),
            ButtonContent(text: "Кнопка 2", action: {}),
            ButtonContent(text: "Кнопка 3", action: {})
        ], menuPosition: CGPoint(x: 330, y: 400))
    }
}
