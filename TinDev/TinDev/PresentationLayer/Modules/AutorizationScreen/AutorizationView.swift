//
//  AutorizationView.swift
//

import SwiftUI

struct AutorizationView: View {
    var body: some View {
        VStack(spacing: 14) {
            SolidButton(action: {},
                        title: "Регистрация",
                        disabled: false,
                        font: .headline,
                        frameMaxWidth: .infinity,
                        foregroundColor: Pallete.customGray
            )
            
            BorderButton(action: {},
                         title: "Вход",
                         disabled: false,
                         font: .headline,
                         frameMaxWidth: .infinity,
                         foregroundColor: Pallete.customBlack)
//            .overlay(RoundedRectangle(cornerRadius: 15)
//                .stroke(Pallete.customBlack, lineWidth: 1))
        }
    }
}

struct AutorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AutorizationView()
    }
}
