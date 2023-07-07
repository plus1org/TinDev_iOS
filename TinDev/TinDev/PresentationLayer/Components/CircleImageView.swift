//
//  CircleImageView.swift
//  TinDev
//
//  Created by mttm on 07.07.2023.
//

import SwiftUI

struct CircleImageView: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle())
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(imageName: "guys")
    }
}
