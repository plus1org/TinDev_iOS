//
//  LoginScreenView.swift
//

import SwiftUI

struct LoginScreenView: View {
    
    @State private var phoneNumber = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 15) {
                Text(Localizable.AutorizationModule.loginTitle).font(Fonts.regular32)
                
                TextFieldStandart(headerText: Localizable.AutorizationModule.phoneNumber,
                                  text: phoneNumber,
                                  placeholder: "+7 (",
                                  textForegroundColor: Pallete.customBlack)
                
                TextFieldStandart(headerText: Localizable.AutorizationModule.password,
                                  text: password,
                                  placeholder: Localizable.AutorizationModule.passwordPlaceholder,
                                  textForegroundColor: Pallete.customBlack)
                
                HStack {
                    Button(action: {}) {
                        Text(Localizable.AutorizationModule.forgotPassword).font(Fonts.regular14)
                    }
                    Spacer()
                }
                .padding(.leading)
            }
            .padding()
            Spacer()
            VStack(spacing: 14) {
                BorderButton(action: {
                }, title: Localizable.AutorizationModule.regButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customBlack)
                
                SolidButton(action: {
                }, title: Localizable.AutorizationModule.loginButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
            }
            .padding(.bottom)
        }
    }
}

struct EnterScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
