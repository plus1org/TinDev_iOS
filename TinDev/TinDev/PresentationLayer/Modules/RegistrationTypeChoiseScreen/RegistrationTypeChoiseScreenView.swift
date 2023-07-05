//
//  RegistrationTypeChoiseScreenView.swift
//  TinDev
//
//  Created by M on 05.07.2023.
//

import SwiftUI

struct RegistrationTypeChoiseScreenView: View {
    
    @State private var isAutorizationViewPresented = false
    
    
    var body: some View {
        NavigationView {
            
            VStack() {
                Spacer()
                VStack(spacing: UIScreen.main.bounds.height * 0.35){
                    VStack(){
                        Text(Localizable.RegestrationModule.choise)
                            .foregroundColor(Pallete.customBlack)
                            .font(Font.custom("SF Pro Text", size: 32))
                            .lineSpacing(2)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        
                        HStack(spacing: UIScreen.main.bounds.width * 0.03) {
                            SegmentedPicker(titles: [Localizable.RegestrationModule.standart,Localizable.RegestrationModule.business], selectedItemColor: Pallete.mainColor, backgroundColor: Pallete.customWhite, selectedItemFontColor: .white, defaultItemFontColor: Pallete.customDarkGray)
                        }
                        
                    }
                    
                    SolidButton(action: {
                        //
                    }, title: Localizable.RegestrationModule.next, disabled: false, font: Font.custom("SF Pro Text", size: 17), frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
                    
                }
                .padding(.bottom, 16)
            }
            
            .background(.white)
            .navigationBarTitle(Localizable.RegestrationModule.back, displayMode: .inline)
            .font(Fonts.regular17)
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button {
                        self.isAutorizationViewPresented = true
                    } label: {
                        Image(systemName: Images.arrowBack)
                            .foregroundColor(Pallete.customBlack)
                    }                 .fullScreenCover(isPresented: $isAutorizationViewPresented) {
                        AutorizationView()
                    }
                }
            }
        }
    }
}

struct RegistrationTypeChoiseScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationTypeChoiseScreenView()
    }
}


