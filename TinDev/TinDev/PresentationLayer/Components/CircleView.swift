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
                    .overlay(Circle().stroke(Pallete.customGray, lineWidth: 0.5))
                    .shadow(radius: 2)
                
            } else {
                ZStack {
                    Circle().foregroundColor(Pallete.customGray)
                    if systemImage == .plus {
                        Image(systemName: systemImage.rawValue)
                            .frame(width: 50, height: 50)
                    } else {
                        Image(systemName: Images.camera)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .scaleEffect(5)
                            .foregroundColor(Pallete.customDarkGray)
                    }
                }.scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Pallete.customGray, lineWidth: 0.5))
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
                        .fill(Pallete.customGray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    Image(systemName: Images.plus)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Pallete.customBlack)
                    
                }
            }
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(imageName: nil, systemImage: .camera, figureType: .circle)
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
