//
//  CircleView.swift
//

import SwiftUI

struct CircleView: View, Hashable {
    let imageName: String?
    var body: some View {
        if imageName != nil {
            Image(imageName ?? "")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
                .shadow(radius: 2)
        } else {
            ZStack {
                Circle().foregroundColor(.gray)
                Image(systemName: "plus")
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
