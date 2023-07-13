//
//  RegistrationBusinessView.swift
//

import SwiftUI

struct RegistrationBusinessView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var text: String = ""
    
    let photos = [
        CircleView(imageName: "swiftlogo", figureType: .square),
        CircleView(imageName: nil, figureType: .square),
        CircleView(imageName: nil, figureType: .square),
        CircleView(imageName: nil, figureType: .square)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    VStack (spacing: 16){
                        TextFieldStandart(headerText: Localizable.RegistrationBusinessModule.orgTitle,
                                          placeholder: Localizable.RegistrationBusinessModule.orgTitlePlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.RegistrationBusinessModule.adress,
                                          placeholder: Localizable.RegistrationBusinessModule.adressPlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.RegistrationBusinessModule.inn,
                                          placeholder: Localizable.RegistrationBusinessModule.innPlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                    } .padding(.top, 20)
                    
                    Text(Localizable.RegistrationBusinessModule.addPhoto)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Fonts.regular15)
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(photos, id: \.self) { photo in
                                photo.frame(width: 100, height: 105)
                            }
                        }
                    }
                    MultilineTextField(headerText: Localizable.RegistrationBusinessModule.description,
                                       text: text,
                                       placeholder: Localizable.RegistrationBusinessModule.descriptionPlaceholder,
                                       textForegroundColor: Pallete.customBlack)
                    Spacer()
                    SolidButton(action: {
                        //
                    }, title: Localizable.RegistrationBusinessModule.regButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
                    
                } .padding(.horizontal)
                    .navigationBarTitle(Localizable.RegestrationPersonModule.navRegTitle, displayMode: .inline)
                    .font(Fonts.regular17)
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
            .hideKeyboard()
        }
    }
}

struct RegistrationBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationBusinessView()
    }
}
