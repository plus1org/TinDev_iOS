//
//  ConfirmPersonView.swift
//

import SwiftUI


struct ConfirmPersonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isCameraPresented = false
    
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
                        Text(Localizable.ConfirmPersonModule.skipConfirm)
                            .font(Fonts.regular16)
                    }.frame(maxWidth: .infinity)
                }
                
                VStack(spacing: 14) {
                    Spacer()
                    
                    Button {
                        self.isCameraPresented = true
                    } label: {
                        Image(systemName: Images.camera).foregroundColor(Pallete.customBlack)
                            .padding(.leading)
                        Text(Localizable.ConfirmPersonModule.makePhoto)
                            .foregroundColor(Pallete.customBlack)
                            .font(Fonts.regular16)
                    }.frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(.horizontal)
                    .background(Pallete.customGray)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    .alert(Localizable.ConfirmPersonModule.makePhoto,
                               isPresented: $isCameraPresented) {
                            Button("OK", role: .cancel) { }
                        }
                    
                    SolidButton(action: { presentationMode.wrappedValue.dismiss() },
                                title: Localizable.ConfirmPersonModule.sendPhoto,
                                disabled: false,
                                font: Fonts.regular16,
                                frameMaxWidth: .infinity,
                                foregroundColor: Pallete.customWhite)
                }
            }.navigationBarTitle(Localizable.ConfirmPersonModule.checkPerson, displayMode: .inline)
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
    }
}

struct ConfirmPersonView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPersonView()
    }
}
