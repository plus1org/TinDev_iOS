//
//  Strings.swift
//

import Foundation

enum Localizable {
    enum RegestrationModule {
        static let navRegTitle = "Регистрация"
        static let photo = "Ваши фотографии"
        static let confirmID = "Подтвердите личность"
        static let name = "Имя"
        static let namePlaceholder = "Ваше имя"
        static let secondName = "Фамилия"
        static let secondNamePlaceholder = "Ваша фамилия"
        static let date = "Дата"
        static let datePlaceholder = "Выберите дату"
        static let password = "Пароль"
        static let passwordPlaceholder = "Введите пароль"
        static let confirmPassword = "Подтверждение пароля"
        static let confirmPasswordPlaceholder = "Подтвердите пароль"
        static let regButton = "Зарегистрироваться"
        
    }
    
    enum LoginModule {
        static let loginTitle = "Вход"
        static let phoneNumber = "Номер телефона"
        static let password = "Пароль"
        static let passwordPlaceholder = "Введите пароль"
        static let forgotPassword = "Забыли пароль?"
        static let regButton = "Зарегистрироваться"
        static let loginButton = "Войти"
    }
    
    enum PasswordRecoveryModule {
        static let passwordRecoveryTitle = "Восстановление пароля"
        static let phoneNumber = "Номер телефона"
        static let passwordRecovery = "Восстановить пароль"
        static let smsMessage = "На ваш номер отправлено СМС с инструкциями по восстановлению пароля"
    }

    enum AutorizationModule { }
    
    enum FiltersModule {
        static let navTitle = "Фильтры"
        static let changeCategory = "Выбрать категорию"
        static let date = "Дата"
        static let datePlaceholder = "Введите дату"
        static let time = "Время"
        static let timePlaceholder = "Введите время"
        static let city = "Город"
        static let cityPlaceholder = "Введите город"
        static let metro = "Метро"
        static let metroPlaceholder = "Введите метро"
        static let district = "Район"
        static let districtPlaceholder = "Введите район"
        static let saveButton = "Сохранить"
    }
}
