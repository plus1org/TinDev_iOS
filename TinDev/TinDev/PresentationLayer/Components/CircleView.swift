//
//  CircleView.swift
//

import SwiftUI

struct CircleView: View, Hashable {
    let imageName: String?
    var systemImage: SystemImage = .plus
    var body: some View {
        if imageName != nil {
            Image(imageName!)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
                .shadow(radius: 2)
        } else {
            ZStack {
                Circle().foregroundColor(.gray)
                Image(systemName: systemImage.rawValue)
                    .frame(width: 50, height: 50)
            }.scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
                .shadow(radius: 2)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(imageName: "swiftlogo")
    }
}

enum SystemImage: String {
    case plus
    case camera
}
