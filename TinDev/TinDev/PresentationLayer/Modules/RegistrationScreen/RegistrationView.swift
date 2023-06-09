//
//  RegistrationView.swift
//

import SwiftUI

struct RegistrationView: View {
    
    let photos = [CircleView(imageName: "swiftlogo", figureType: .circle),
                  CircleView(imageName: nil, figureType: .circle),
                  CircleView(imageName: nil, figureType: .circle),
                  CircleView(imageName: nil, figureType: .circle)]
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Localizable.RegestrationModule.navRegTitle)
                .font(Fonts.regular17)
           
            VStack(spacing: 25) {
                VStack {
                    Text(Localizable.RegestrationModule.photo)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Fonts.regular15)
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(photos, id: \.self) { photo in
                                photo.frame(width: 105, height: 105)
                            }
                        }
                    }.padding(.leading)
                    
                    Button {
                        print("tap")
                    } label: {
                        Text(Localizable.RegestrationModule.confirmID)
                            .font(Fonts.regular14)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
                
                VStack(spacing: 15) {
                    
                    HStack(spacing: 11) {
                        TextFieldStandart(headerText: Localizable.RegestrationModule.name, text: "", placeholder: Localizable.RegestrationModule.namePlaceholder, textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.RegestrationModule.secondName, text: "", placeholder: Localizable.RegestrationModule.secondNamePlaceholder, textForegroundColor: Pallete.customBlack)
                    }
                    TextFieldStandart(headerText: Localizable.RegestrationModule.date, text: "", placeholder: Localizable.RegestrationModule.datePlaceholder, textForegroundColor: Pallete.customBlack)
                    TextFieldStandart(headerText: Localizable.RegestrationModule.password, text: "", placeholder: Localizable.RegestrationModule.passwordPlaceholder, textForegroundColor: Pallete.customBlack)
                    TextFieldStandart(headerText: Localizable.RegestrationModule.confirmPassword, text: "", placeholder: Localizable.RegestrationModule.confirmPasswordPlaceholder, textForegroundColor: Pallete.customBlack)
                }.padding(.horizontal)
            }
            Spacer()
            
            SolidButton(action: {
                print("tapped")
            }, title: Localizable.RegestrationModule.regButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
        }.background(.white)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
