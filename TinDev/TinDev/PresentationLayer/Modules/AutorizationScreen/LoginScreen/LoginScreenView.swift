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
                Text(Localizable.LoginModule.loginTitle).font(Fonts.regular32)
                
                TextFieldStandart(headerText: Localizable.LoginModule.phoneNumber,
                                  text: phoneNumber,
                                  placeholder: "+7 (",
                                  textForegroundColor: Pallete.customBlack)
                
                TextFieldStandart(headerText: Localizable.LoginModule.password,
                                  text: password,
                                  placeholder: Localizable.LoginModule.passwordPlaceholder,
                                  textForegroundColor: Pallete.customBlack)
                
                HStack {
                    Button(action: {}) {
                        Text(Localizable.LoginModule.forgotPassword).font(Fonts.regular14)
                    }
                    Spacer()
                }.padding(.leading)
            }.padding()
            Spacer()
            VStack(spacing: 14) {
                BorderButton(action: {
                }, title: Localizable.LoginModule.regButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customBlack)
                
                SolidButton(action: {
                }, title: Localizable.LoginModule.loginButton, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
            }.padding(.bottom)
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}

