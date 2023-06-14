//
//  ConfirmPersonView.swift
//

import SwiftUI


struct ConfirmPersonView: View {
    
    @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            NavigationView {
                
                VStack {
                    VStack {
                        Spacer()
                        CircleView(imageName: nil, systemImage: .camera, figureType: .circle)
                            .frame(width: 240, height: 240)
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Подтвердить позже")
                                .font(Fonts.regular16)
                        }.frame(maxWidth: .infinity)
                    }
                
                VStack(spacing: 14) {
                    Spacer()
                    BorderButton(action: {
                        //
                    }, title: "Сделать фото", disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customBlack)
                    
                    SolidButton(action: {
                        //
                    }, title: "Отправить", disabled: false, font: Fonts.regular16, frameMaxWidth: .infinity, foregroundColor: Pallete.customWhite)
                }
            } .navigationBarTitle("Подтверждение личности", displayMode: .inline)
                .toolbar {
                    ToolbarItemGroup(placement: .cancellationAction) {
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(Pallete.customBlack)
                        }
                    }
                }
            }
        }
}

struct ConfirmPersonView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPersonView()
    }
}
