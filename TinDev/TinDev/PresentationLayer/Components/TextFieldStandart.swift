//
//  TextFieldStandart.swift
//

import SwiftUI

struct TextFieldStandart: View {
    let headerText: String
    var state: TextFieldState = .empty
    
    @State var text: String
    let placeholder: String
    
    let textForegroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            switch state {
            case .empty:
                Text(headerText)
                    .foregroundColor(textForegroundColor)
                    .font(Fonts.regular15)
                
                TextField(placeholder, text: $text)
                    .frame(height: 50)
                    .font(Fonts.regular14)
                    .padding(.leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Pallete.customGray, lineWidth: 1)
                    )
            case .withText:
                Text(headerText)
                    .foregroundColor(textForegroundColor)
                    .font(Fonts.regular15)
                
                TextField(placeholder, text: $text)
                    .frame(height: 50)
                    .font(Fonts.regular14)
                    .padding(.leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Pallete.customBlack, lineWidth: 1.5)
                    )
            }
        }
    }
}

struct TextFieldStandart_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStandart(headerText: "Label", text: "", placeholder: "ввдедите имя", textForegroundColor: .black)
        
    }
}

enum TextFieldState {
    case empty
    case withText
}

