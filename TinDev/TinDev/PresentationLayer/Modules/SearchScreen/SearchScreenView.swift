//
//  SearchScreenView.swift
//  TinDev
//
//  Created by M on 29.06.2023.
//

import SwiftUI

struct SearchScreenView: View {
    @Binding var text: String
    
    var placeholder: String
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
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
                .padding(.horizontal, 16) //Search Bar

                    Button {
                        //
                    }
            label: { HStack {
                    Text(Localizable.SearchScreenModule.filters)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(6)
                        .foregroundColor(Pallete.customBlack)
                        .font(Fonts.regular14)
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding(6)
                        .foregroundColor(Pallete.customBlack)
                    
                }
            
                .frame(width: 105, height: 36)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 16)
                    Spacer()

                } //Filters

                
            }
            .navigationBarTitle(Localizable.SearchScreenModule.events, displayMode: .inline).font(Fonts.regular17)
        }
    }
}

struct FindScreenView_Previews: PreviewProvider {
    
    @State static var text = ""
    
    static var previews: some View {
        SearchScreenView(text: $text, placeholder: "Поиск")
    }
}
