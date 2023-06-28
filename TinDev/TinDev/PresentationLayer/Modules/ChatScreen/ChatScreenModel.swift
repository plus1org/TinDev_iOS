//
//  ChatScreenModel.swift
//  TinDev
//
//  Created by mttm on 19.06.2023.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    var text: String
    var isUserMessage: Bool
}

struct Chat {
    var isConfirmed: Bool
    var personImage: String
    var personName: String
    var messageDate: String
    var messages: [Message]
}
