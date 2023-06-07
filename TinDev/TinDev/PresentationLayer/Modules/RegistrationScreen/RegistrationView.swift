//
//  RegistrationView.swift
//

import SwiftUI

struct RegistrationView: View {
    
    let photos = [CircleView(imageName: "swiftlogo"),
                  CircleView(imageName: nil),
                  CircleView(imageName: nil),
                  CircleView(imageName: nil)]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Регистрация")
                .font(.title)
           
            VStack(spacing: 25) {
                VStack {
                    Text("Ваши фотографии")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(photos, id: \.self) { photo in
                                photo.frame(width: 105, height: 105)
                            }
                        }
                    }.padding(.leading)
                    
                    Button {
                        print("tap")
                    } label: {
                        Text("Подтвердите личность")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
                
                VStack(spacing: 15) {
                    
                    HStack(spacing: 11) {
                        TextFieldStandart(headerText: "Имя", text: "", placeholder: "Ваше имя", textForegroundColor: .black)
                        TextFieldStandart(headerText: "Фамилия", text: "", placeholder: "Ваша фамилия", textForegroundColor: .black)
                    }
                    TextFieldStandart(headerText: "Дата", text: "", placeholder: "Выберите дату", textForegroundColor: .black)
                    TextFieldStandart(headerText: "Пароль", text: "", placeholder: "Введите пароль", textForegroundColor: .black)
                    TextFieldStandart(headerText: "Подтверждение пароля", text: "", placeholder: "Подтвердите пароль", textForegroundColor: .black)
                }.padding(.horizontal)
            }
            Spacer()
            
            SolidButton(action: {
                print("tapped")
            }, title: "Зарегистрироваться", disabled: false, font: .title3, frameMaxWidth: .infinity, foregroundColor: .white)
        }.background(.white)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
