//
//  PasswordRecoveryScreenView.swift
// 

import SwiftUI

struct PasswordRecoveryScreenView: View {
    
    @State private var phoneNumber = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 15) {
                Text(Localizable.PasswordRecoveryModule.passwordRecoveryTitle)
                    .font(Fonts.regular32)
                    .multilineTextAlignment(.center)
                
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
                SolidButton(action: {
                }, title: Localizable.PasswordRecoveryModule.passwordRecovery, disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
            }.padding(.bottom)
        }
    }
}

struct PasswordRecoveryScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRecoveryScreenView()
    }
}
