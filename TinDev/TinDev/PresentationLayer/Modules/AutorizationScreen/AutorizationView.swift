//
//  AutorizationView.swift
//

import SwiftUI

struct AutorizationView: View {
    @State private var isRegistrationTypeChoiseScreenViewPresented = false
    @State private var isLoginScreenPresented = false
    
    var body: some View {
        
        VStack() {
            
            SolidButton(action: {self.isRegistrationTypeChoiseScreenViewPresented = true},
                        title: Localizable.AutorizationModule.registration,
                        disabled: false,
                        font: .headline,
                        frameMaxWidth: .infinity,
                        foregroundColor: Pallete.customGray)
            //MARK: Navigation
            .fullScreenCover(isPresented: $isRegistrationTypeChoiseScreenViewPresented) {
                RegistrationTypeChoiseScreenView()
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
