//
//  TextFieldStandart.swift
//

import SwiftUI

struct TextFieldStandart: View {
    let headerText: String
    
    @State private var isEditing = false
    @State var text: String = ""
    
    let placeholder: String
    
    let textForegroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
                Text(headerText)
                    .foregroundColor(textForegroundColor)
                    .font(Fonts.regular15)
            TextField(placeholder, text: $text, onEditingChanged: { editing in
                self.isEditing = editing
            }, onCommit: {
            })
            .frame(height: 50)
            .font(Fonts.regular14)
            .padding(.leading)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isEditing ? Pallete.customBlack : Pallete.customGray, lineWidth: 2)
            )
        }
    }
}

struct TextFieldStandart_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStandart(headerText: "Label", text: "", placeholder: "ввдедите имя", textForegroundColor: .black)
        
    }
}