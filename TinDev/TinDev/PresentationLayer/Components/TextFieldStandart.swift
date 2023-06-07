//
//  TextFieldStandart.swift
//

import SwiftUI

struct TextFieldStandart: View {
    let headerText: String

    @State var text: String
    let placeholder: String
    
    let textForegroundColor: Color
    var body: some View {
        VStack {
            Text(headerText)
                .foregroundColor(textForegroundColor)
                .font(.headline)
                TextField(placeholder, text: $text)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
        }
    }
}

struct TextFieldStandart_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStandart(headerText: "Label", text: "", placeholder: "ввдедите имя", textForegroundColor: .black)
        
    }
}



