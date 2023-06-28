//
//  LoginScreenView.swift
//  


import SwiftUI

struct LoginScreenView: View {
    
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var isPasswordRecoveryScreenPresented = false
    @State private var isRegistrationScreenPresented = false
    @State private var isTabBarPresented = false
    
    var body: some View {
        NavigationView {
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
                        Button(action: {self.isPasswordRecoveryScreenPresented = true}) {
                            Text(Localizable.LoginModule.forgotPassword).font(Fonts.regular14)
                        }
                        .fullScreenCover(isPresented: $isPasswordRecoveryScreenPresented) {
                            PasswordRecoveryScreenView()
                        }
                        Spacer()
                    }.padding(.leading)
                }.padding()
                Spacer()
                VStack(spacing: 14) {
                    BorderButton(action: {self.isRegistrationScreenPresented = true},
                                 title: Localizable.LoginModule.regButton,
                                 disabled: false,
                                 font: Fonts.regular16,
                                 frameMaxWidth: .infinity,
                                 foregroundColor: Pallete.customBlack)
                    .fullScreenCover(isPresented: $isRegistrationScreenPresented) {
                        RegistrationView()
                    }
                    
                    SolidButton(action: {self.isTabBarPresented = true},
                                title: Localizable.LoginModule.loginButton,
                                disabled: false,
                                font: Fonts.regular16,
                                frameMaxWidth: .infinity,
                                foregroundColor: Pallete.customWhite)
                    .fullScreenCover(isPresented: $isTabBarPresented) {
                        TabBarView()
                    }
                }.padding(.bottom)
            }
        }
        .hideKeyboard()
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}

