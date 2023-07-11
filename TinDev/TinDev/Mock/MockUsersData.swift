//
//  MockUsersData.swift
//  TinDev
//
//  Created by mttm on 07.07.2023.
//

import Foundation

struct MockUsersData {
    static let users: [User] = [
        User(name: "Евгений Лапин", isOnline: true, imageName: "person6", message: "Привет! Как дела?"),
        User(name: "Юлия Резникова", isOnline: false, imageName: "person9", message: "До встречи на событии!"),
        User(name: "Кирилл Ларионов", isOnline: true, imageName: "person4", message: "Я уже почти пришел!"),
        User(name: "Соня Агафьева", isOnline: false, imageName: "person7", message: "Не могу дозвониться..."),
        User(name: "Дима Курцин", isOnline: true, imageName: "person5", message: "У меня все в порядке."),
        User(name: "Ксения Беглова", isOnline: false, imageName: "person8", message: "Сегодня пропущу.")
    ]
}
