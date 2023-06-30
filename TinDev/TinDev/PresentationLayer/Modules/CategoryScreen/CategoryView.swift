//
//  CategoryView.swift
//

import SwiftUI

struct CategoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            
            VStack {
                VStack {
                    CustomTable()
                }
                
                Spacer()
                
                HStack {
                    SolidButton(action: {
                        //
                    }, title: Localizable.CategoryModule.applyButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
                    BorderButton(action: {
                        //
                    }, title: Localizable.CategoryModule.addButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customBlack)
                }.padding(.horizontal, 8)
                .padding(.bottom)
                
            }.navigationBarTitle(Localizable.CategoryModule.navTitle, displayMode: .inline)
                .toolbar {
                    ToolbarItemGroup(placement: .cancellationAction) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: Images.arrowBack)
                                .foregroundColor(Pallete.customBlack)
                        }
                    }
                }
            }
        }
    }

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}





