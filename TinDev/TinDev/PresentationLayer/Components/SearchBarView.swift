//
//  SearchBarView.swift
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
  
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: Images.magnifyingGlass)
                .foregroundColor(.gray)
                .padding(.leading, 8)
            TextField(placeholder, text: $text)
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: Images.closeButton)
                    .foregroundColor(.gray)
            }
            .opacity(text.isEmpty ? 0 : 1)
        }
        .frame(height: 36)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.top, 10)
        .padding(.horizontal, 16)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var text = ""

    static var previews: some View {
        SearchBarView(text: $text, placeholder: "Поиск по чатам")
            .previewLayout(.sizeThatFits)
    }
}
