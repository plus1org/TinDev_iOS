//
//  MockUsersData.swift
//  TinDev
//
//  Created by mttm on 07.07.2023.
//

import Foundation

struct MockUsersData {
    static let users: [User] = [
        User(name: "Евгений Лапин", isOnline: true, imageName: "person6"),
        User(name: "Юлия Резникова", isOnline: false, imageName: "person9"),
        User(name: "Кирилл Ларионов", isOnline: true, imageName: "person4"),
        User(name: "Соня Агафьева", isOnline: false, imageName: "person7"),
        User(name: "Дима Курцин", isOnline: true, imageName: "person5"),
        User(name: "Ксения Беглова", isOnline: false, imageName: "person8")
    ]
}
