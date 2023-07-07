//
//  Buttons.swift
//

import SwiftUI

struct RegularButtons: View {
    var body: some View {
        ZStack {
            Pallete.customBlack
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                SolidButton(action: {},
                            title: "Solid Button",
                            disabled: false,
                            font: .headline,
                            frameMaxWidth: .infinity,
                            foregroundColor: Pallete.customBlack
                )
                BorderButton(action: {},
                             title: "Border Button",
                             disabled: false,
                             font: .headline,
                             frameMaxWidth: .infinity,
                             foregroundColor: Pallete.mainColor
                )
                SmallButton(action: {},
                            title: "Small Button",
                            disabled: false,
                            font: .headline,
                            frameMaxWidth: .infinity,
                            foregroundColor: Pallete.customBlack,
                            backgroundColor: Pallete.customGray,
                            imageName: "person"
                )
            }
        }
    }
}

struct SolidButton: View {
    var action: () -> Void
    var title: String
    var disabled: Bool
    var font: Font
    var frameMaxWidth: CGFloat
    var foregroundColor: Color
    var backgroundColor: Color?

    var body: some View {
        Button(action: action) {
            Text(title)
                .buttonCommonStyle(font: font,
                                   frameMaxWidth: frameMaxWidth,
                                   foregroundColor: foregroundColor)
                .background(backgroundColor ?? Pallete.mainColor)
                .cornerRadius(15)
        }
        .disabled(disabled)
        .padding(.horizontal)
        .padding(.bottom, 16)
    }
}

struct BorderButton: View {
    var action: () -> Void
    var title: String
    var disabled: Bool
    var font: Font
    var frameMaxWidth: CGFloat
    var foregroundColor: Color

    var body: some View {
        Button(action: action) {
            Text(title)
                .buttonCommonStyle(font: font,
                                   frameMaxWidth: frameMaxWidth,
                                   foregroundColor: foregroundColor)
                .frame(height: 50)
                .background( // MARK: border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Pallete.mainColor, lineWidth: 1)
                )
        }
        .disabled(disabled)
        .padding(.horizontal)
        .padding(.bottom, 16)
    }
}

struct SmallButton: View {
    var action: () -> Void
    var title: String
    var disabled: Bool
    var font: Font
    var frameMaxWidth: CGFloat
    var foregroundColor: Color
    var backgroundColor: Color
    var imageName: String?

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Spacer()
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Text(title)
                    .font(font)
                Spacer()
            }
            .foregroundColor(foregroundColor)
            .frame(height: 35)
            .background(backgroundColor)
            .cornerRadius(12)
        }
        .disabled(disabled)
        .padding(.horizontal)
    }
}

struct RegularButtons_Previews: PreviewProvider {
    static var previews: some View {
        RegularButtons()
    }
}
