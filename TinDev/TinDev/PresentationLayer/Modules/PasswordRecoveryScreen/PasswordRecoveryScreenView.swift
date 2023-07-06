//
//  PasswordRecoveryScreenView.swift
// 

import SwiftUI

struct PasswordRecoveryScreenView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var phoneNumber = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(spacing: 30) {
                    Text(Localizable.PasswordRecoveryModule.passwordRecoveryTitle)
                        .font(Fonts.regular32)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                    
                    SegmentedPicker(titles: [Localizable.PasswordRecoveryModule.phone, Localizable.PasswordRecoveryModule.email],
                                    selectedItemColor: Pallete.customWhite,
                                    backgroundColor: Pallete.customGray,
                                    selectedItemFontColor: Pallete.customBlack,
                                    defaultItemFontColor: Pallete.customDarkGray,
                                    borderColor: Pallete.customBlack)
                    .frame(width: 255)
                }
                .padding(.bottom, 30)
                VStack(spacing: 15) {
                    
                    TextFieldStandart(headerText: Localizable.PasswordRecoveryModule.phoneNumber,
                                      text: phoneNumber,
                                      placeholder: "+7 (",
                                      textForegroundColor: Pallete.customBlack)
                    
                    HStack {
                        Text(Localizable.PasswordRecoveryModule.smsMessage)
                            .font(Fonts.regular12)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.blue)
                        Spacer()
                    }
                }.padding()
                Spacer()
                VStack(spacing: 14) {
                    SolidButton(action: { presentationMode.wrappedValue.dismiss() },
                                title: Localizable.PasswordRecoveryModule.passwordRecovery,
                                disabled: false,
                                font: Fonts.regular16,
                                frameMaxWidth: .infinity,
                                foregroundColor: Pallete.customWhite)
                    
                }.padding(.bottom)
            }
        }
        .hideKeyboard()
    }
}

struct PasswordRecoveryScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecoveryScreenView()
    }
}
