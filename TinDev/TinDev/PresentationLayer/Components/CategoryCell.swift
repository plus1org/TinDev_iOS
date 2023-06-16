//
//  CategoryCell.swift
//  TinDev
//
//  Created by Анастасия on 16.06.2023.
//

import SwiftUI

struct CategoryCell: View {
    var body: some View {
        HStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            Image(systemName: "checkmark.circle.fill").foregroundColor(Color.blue)
                .padding(.trailing)
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell()
    }
}
