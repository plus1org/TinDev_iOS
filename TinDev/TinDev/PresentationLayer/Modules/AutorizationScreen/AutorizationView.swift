//
//  AutorizationView.swift
//

import SwiftUI

struct AutorizationView: View {
    @State private var isRegistrationScreenPresented = false
    @State private var isLoginScreenPresented = false
    
    var body: some View {
        
        VStack(spacing: 14) {
            
            SolidButton(action: {self.isRegistrationScreenPresented = true},
                        title: Localizable.AutorizationModule.registration,
                        disabled: false,
                        font: .headline,
                        frameMaxWidth: .infinity,
                        foregroundColor: Pallete.customGray)
            //MARK: Navigation
            .fullScreenCover(isPresented: $isRegistrationScreenPresented) {
                RegistrationView()
            }
            
            BorderButton(action: {self.isLoginScreenPresented = true},
                         title: Localizable.AutorizationModule.entrance,
                         disabled: false,
                         font: .headline,
                         frameMaxWidth: .infinity,
                         foregroundColor: Pallete.customBlack)
            //MARK: Navigation
            .fullScreenCover(isPresented: $isLoginScreenPresented) {
                LoginScreenView()
            }
        }
    }
}

struct AutorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AutorizationView()
    }
}
