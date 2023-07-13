//
//  RegistrationView.swift
//

import SwiftUI

struct RegistrationPersonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isShowingFullScreen = false
    @State private var isLoginScreenPresented = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(spacing: 25) {
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            ZStack {
                                Circle().foregroundColor(Pallete.customGray)
                                Image(systemName: Images.camera)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .scaleEffect(3)
                                    .foregroundColor(Pallete.customDarkGray)
                            }
                            .frame(width: 120, height: 120)
                            
                            Button {
                                //
                            } label: {
                                Image(systemName: Images.plus)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                                    .background(Pallete.mainColor)
                                    .clipShape(Circle())
                            }.padding(.leading)
                        }

                        Button {
                            self.isShowingFullScreen = true
                        } label: {
                            Image(systemName: Images.person)
                            Text(Localizable.RegestrationPersonModule.confirmID)
                                .foregroundColor(Pallete.customBlue)
                                .font(Fonts.regular14)
                        }.frame(maxWidth: .infinity, alignment: .center)
                            .fullScreenCover(isPresented: $isShowingFullScreen) {
                                ConfirmPersonView()
                            }.padding(.top)
                    }
                    
                    VStack(spacing: 15) {
                        
                        HStack(spacing: 11) {
                            TextFieldStandart(headerText: Localizable.RegestrationPersonModule.name,
                                              text: "",
                                              placeholder: Localizable.RegestrationPersonModule.namePlaceholder,
                                              textForegroundColor: Pallete.customBlack)
                            TextFieldStandart(headerText: Localizable.RegestrationPersonModule.secondName,
                                              text: "",
                                              placeholder: Localizable.RegestrationPersonModule.secondNamePlaceholder,
                                              textForegroundColor: Pallete.customBlack)
                        }
                        TextFieldStandart(headerText: Localizable.RegestrationPersonModule.date,
                                          text: "",
                                          placeholder: Localizable.RegestrationPersonModule.datePlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.RegestrationPersonModule.email,
                                                                  text: "",
                                                                  placeholder: Localizable.RegestrationPersonModule.emailPlaceholder,
                                                                  textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.RegestrationPersonModule.password,
                                          text: "",
                                          placeholder: Localizable.RegestrationPersonModule.passwordPlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.RegestrationPersonModule.confirmPassword,
                                          text: "",
                                          placeholder: Localizable.RegestrationPersonModule.confirmPasswordPlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                    }.padding(.horizontal)
                }
                Spacer()
                
                SolidButton(action: {self.isLoginScreenPresented = true},
                            title: Localizable.RegestrationPersonModule.regButton,
                            disabled: false,
                            font: Fonts.regular16,
                            frameMaxWidth: .infinity,
                            foregroundColor: Pallete.customWhite)
                .fullScreenCover(isPresented: $isLoginScreenPresented) {
                    LoginScreenView()
                }
            }.background(.white)
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPersonView()
    }
}
