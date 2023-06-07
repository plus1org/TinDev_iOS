//
//  RegistrationView.swift
//

import SwiftUI

struct RegistrationView: View {
    
    let photos = [CircleView(imageName: "swiftlogo"), CircleView(imageName: nil), CircleView(imageName: nil), CircleView(imageName: nil), CircleView(imageName: nil)]
    
    var body: some View {
        VStack(spacing: 4) {
            Text("Регистрация")
                .padding(.horizontal)
                .font(.title)
            
            Text("Ваши фотографии")
                .padding(.leading, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(105))]) {
                    HStack {
                        ForEach(photos, id: \.self) { photo in
                            photo
                        }
                    }
                }
            }.padding(.horizontal)
            
            Button {
                print("tap")
            } label: {
                Text("Подтвердите личность")
            }.padding(.leading)
            
            Spacer()
            
            VStack(spacing: 11) {
                
                HStack(spacing: 11) {
                    TextFieldStandart(headerText: "Имя", text: "", placeholder: "Введите имя", textForegroundColor: .black)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                    TextFieldStandart(headerText: "Фамилия", text: "", placeholder: "Введите фамилию", textForegroundColor: .black)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                }
                .padding(.horizontal)
                
                TextFieldStandart(headerText: "Дата", text: "", placeholder: "Введите имя", textForegroundColor: .black)
                    .padding(.horizontal)
                TextFieldStandart(headerText: "Пароль", text: "", placeholder: "Введите имя", textForegroundColor: .black)
                    .padding(.horizontal)
                TextFieldStandart(headerText: "Подтверждение пароля", text: "", placeholder: "Введите имя", textForegroundColor: .black)
                    .padding(.horizontal)
            }
            Spacer()
            
            SolidButton(action: {
                print("tapped")
            }, title: "Зарегестрироваться", disabled: false, font: .title3, frameMaxWidth: .infinity, foregroundColor: .white)

        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
