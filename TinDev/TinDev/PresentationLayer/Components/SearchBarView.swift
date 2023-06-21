//
//  SearchBarView.swift
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
  
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField(placeholder, text: $text)
                .padding(.leading, 5)
            
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
            .opacity(text.isEmpty ? 0 : 1)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
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
