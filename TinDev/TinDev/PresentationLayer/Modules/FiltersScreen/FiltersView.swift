//
//  FiltersView.swift
//

import SwiftUI

struct FiltersView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 14) {
                    Button {
                        //
                    } label: {
                        HStack(spacing: 30) {
                            Text(Localizable.FiltersModule.changeCategory)
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
                                    .stroke(Pallete.customDarkGray, lineWidth: 1)
                            )
                    }.padding(.top, 25)
                    
                    HStack(spacing: 11) {
                        
                        TextFieldStandart(headerText: Localizable.FiltersModule.date, text: "", placeholder: Localizable.FiltersModule.datePlaceholder, textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.FiltersModule.time, text: "", placeholder: Localizable.FiltersModule.timePlaceholder, textForegroundColor: Pallete.customBlack)
                    }
                    
                    HStack(spacing: 11) {
                        TextFieldStandart(headerText: Localizable.FiltersModule.city, text: "", placeholder: Localizable.FiltersModule.cityPlaceholder, textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.FiltersModule.metro, text: "", placeholder: Localizable.FiltersModule.metroPlaceholder, textForegroundColor: Pallete.customBlack)
                    }
                    
                    TextFieldStandart(headerText: Localizable.FiltersModule.district, text: "", placeholder: Localizable.FiltersModule.districtPlaceholder, textForegroundColor: Pallete.customBlack)
                }.padding(.horizontal)
                
                Spacer()
                
                SolidButton(action: {
                    //
                }, title: Localizable.FiltersModule.saveButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
            }
            .navigationBarTitle(Localizable.FiltersModule.navTitle, displayMode: .inline)
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button {
                        
                    } label: {
                        Image(systemName: Images.arrowBack)
                            .foregroundColor(Pallete.customBlack)
                    }                }
            }
        }
    }
}

struct Filters_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
