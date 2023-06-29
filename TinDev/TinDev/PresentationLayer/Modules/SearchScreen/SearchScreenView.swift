//
//  SearchScreenView.swift
//  TinDev
//
//  Created by M on 29.06.2023.
//

import SwiftUI

struct SearchScreenView: View {
    var body: some View {
        
        Button {
            //
        }
    label: { HStack(spacing: 30) {
        Text(Localizable.SearchScreenModule.filters)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .foregroundColor(Pallete.customBlack)
            .font(Fonts.regular14)
        Image(systemName: Images.arrowNext)
            .padding(.trailing)
            .foregroundColor(Pallete.customBlack)
    } .frame(maxWidth: .infinity, maxHeight: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Pallete.customDarkGray, lineWidth: 1))
    }
    }
}

struct FindScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView()
    }
}
