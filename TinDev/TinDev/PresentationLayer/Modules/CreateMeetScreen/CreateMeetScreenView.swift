//
//  CreateMeetScreenView.swift
//  TinDev
//
//  Created by M on 26.06.2023.
//

import SwiftUI

struct CreateMeetScreenView: View {
    
    //    @State private var isShowingFullScreen = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isCategoryViewPresented = false
    
    let photos = [CircleView(imageName: "photo1", figureType: .square),
                  CircleView(imageName: nil, figureType: .square),
                  CircleView(imageName: nil, figureType: .square),
                  CircleView(imageName: nil, figureType: .square)]
    
    var body: some View {
        NavigationView {
            VStack() {
                
                VStack(spacing: 15) {
                    
                    Text(Localizable.CreateMeetModule.addPhotos)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Fonts.regular15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(photos, id: \.self) { photo in
                                photo.frame(width: 105, height: 105)
                            }
                        }
                    }
                    
                    TextFieldStandart(headerText: Localizable.CreateMeetModule.meetName,
                                      text: "",
                                      placeholder: Localizable.CreateMeetModule.meetNamePlaceholder,
                                      textForegroundColor: Pallete.customBlack)
                    
                    
                    Button { self.isCategoryViewPresented = true } label: {
                        HStack(spacing: 30) {
                            Text(Localizable.FiltersModule.changeCategory)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .foregroundColor(Pallete.customBlack)
                                .font(Fonts.regular14)
                            Image(systemName: Images.arrowNext)
                                .padding(.trailing)
                                .foregroundColor(Pallete.customBlack)
                        } .frame(maxWidth: .infinity, maxHeight: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Pallete.customDarkGray, lineWidth: 1)
                            )
                    }.fullScreenCover(isPresented: $isCategoryViewPresented) {
                        CategoryView()
                    } // Category + button
                    
                    HStack(spacing: 11) {
                        TextFieldStandart(headerText: Localizable.CreateMeetModule.date,
                                          text: "",
                                          placeholder: Localizable.CreateMeetModule.datePlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.CreateMeetModule.time,
                                          text: "",
                                          placeholder: Localizable.CreateMeetModule.timePlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                    } // Date + time
                    HStack(spacing: 11) {
                        TextFieldStandart(headerText: Localizable.CreateMeetModule.city,
                                          text: "",
                                          placeholder: Localizable.CreateMeetModule.cityPlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                        TextFieldStandart(headerText: Localizable.CreateMeetModule.metro,
                                          text: "",
                                          placeholder: Localizable.CreateMeetModule.metroPlaceholder,
                                          textForegroundColor: Pallete.customBlack)
                    } // City + Metro
                    TextFieldStandart(headerText: Localizable.CreateMeetModule.area,
                                      text: "",
                                      placeholder: Localizable.CreateMeetModule.areaPlaceholder,
                                      textForegroundColor: Pallete.customBlack)
                    TextFieldStandart(headerText: Localizable.CreateMeetModule.discription,
                                      text: "",
                                      placeholder: Localizable.CreateMeetModule.discriptionPlaceholder,
                                      textForegroundColor: Pallete.customBlack)
                }.padding(.horizontal) //From photos To Discription
                
                Spacer()
                
                SolidButton(action: { presentationMode.wrappedValue.dismiss() },
                            title: Localizable.CreateMeetModule.save,
                            disabled: false,
                            font: Fonts.regular16,
                            frameMaxWidth: .infinity,
                            foregroundColor: Pallete.customWhite)
            }.background(.white)
                .navigationBarTitle(Localizable.CreateMeetModule.navTitle, displayMode: .inline).font(Fonts.regular17)
                .toolbar {
                    ToolbarItemGroup(placement: .cancellationAction) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: Images.arrowBack)
                                .foregroundColor(Pallete.customBlack)
                        } // Return button (arrow)
                    }
                }
                .padding(.top)
            
        }
        .hideKeyboard()
    }
}

struct CreateMeetScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMeetScreenView()
    }
}
