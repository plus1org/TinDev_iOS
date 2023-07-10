//
//  EventChatInfoScreenModel.swift
//  TinDev
//
//  Created by mttm on 07.07.2023.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let name: String
    let isOnline: Bool
    let imageName: String
    let message: String
}
