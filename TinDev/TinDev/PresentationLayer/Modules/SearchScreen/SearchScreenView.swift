//
//  SearchScreenView.swift
//  TinDev
//
//  Created by M on 29.06.2023.
//

import SwiftUI

let sportImage = Image("sport")
let danceImage = Image("dance")
let artImage = Image("art")
let theaterImage = Image("theater")
let cinemaImage = Image("cinema")
let anotherImage = Image(systemName: "ellipsis")

let filterForImages = [sportImage,
                       danceImage,
                       artImage,
                       theaterImage,
                       cinemaImage,
                       anotherImage]

let filters = [Localizable.SearchScreenModule.sport,
               Localizable.SearchScreenModule.dance,
               Localizable.SearchScreenModule.art,
               Localizable.SearchScreenModule.theater,
               Localizable.SearchScreenModule.cinema,
               Localizable.SearchScreenModule.another]

struct SearchScreenView: View {
    @State private var isCreateMeetScreenPresented = false
    @State private var isFiltersViewPresented = false
    @State private var isCategoryViewPresented = false
    
    @Binding var text: String
    
    var placeholder: String
    var body: some View {
        NavigationView {
            
            VStack {
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
                    
                    Button {self.isFiltersViewPresented = true}
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
                }
                .fullScreenCover(isPresented: $isFiltersViewPresented) {
                    FiltersView()
                }
                    //Filters
                }
                //MARK: CollectionView:
                ScrollView {
                    LazyVGrid (columns: [GridItem(.flexible()),
                                        GridItem(.flexible()),
                                        GridItem(.flexible())],
                              spacing: 10) {

                        ForEach(0..<6) { index in
                            VStack {
                                let nameCount = filters[index]
                                let imageCount = filterForImages[index]
                                
                                
                                Button {}
                            label: {imageCount
                                .foregroundColor(Pallete.customBlack)
                                .frame(width: 100, height: 100)
                                .cornerRadius(12)
                                .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.black, lineWidth: 1))
                            }
                                HStack {
                                    Text("\(nameCount)")
                                        .frame(alignment: .leading)
                                        .font(Fonts.regular15)
                                    Spacer()
                                }.padding(.leading, 10)
                            }
                        }
                    }
                    .padding(10)
                }
                

                SolidButton(action: {self.isCreateMeetScreenPresented = true},
                            title: "Создать",
                            disabled: false,
                            font: Fonts.regular16,
                            frameMaxWidth: .infinity,
                            foregroundColor: Pallete.customWhite)
                .fullScreenCover(isPresented: $isCreateMeetScreenPresented) {
                    CreateMeetScreenView()
                }
                
                
            }
            
            .padding(.top, 5)
            .navigationBarTitle(Localizable.SearchScreenModule.events, displayMode: .inline).font(Fonts.regular17)
        }
    }
}

struct FindScreenView_Previews: PreviewProvider {
    
    @State static var text = ""
    
    static var previews: some View {
        SearchScreenView(text: $text, placeholder: Localizable.SearchScreenModule.navTitle)
    }
}
