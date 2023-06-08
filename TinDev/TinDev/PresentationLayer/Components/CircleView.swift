//
//  CircleView.swift
//

import SwiftUI

struct CircleView: View, Hashable {
    let imageName: String?
    var systemImage: SystemImage = .plus
    var figureType: FigureType
    var body: some View {
        
        switch figureType {
        case .circle :
            if imageName != nil {
                Image(imageName!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                self.overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
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
            
        case .square :
            if imageName != nil {
                GeometryReader { geometry in
                    Image(imageName!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: min(geometry.size.width, geometry.size.height),
                               height: min(geometry.size.width, geometry.size.height))
                        .clipped()
                }
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .frame(width: 50, height: 50)
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(imageName: "swiftlogo", figureType: .circle)
    }
}

enum SystemImage: String {
    case plus
    case camera
}

enum FigureType {
    case circle
    case square
}
