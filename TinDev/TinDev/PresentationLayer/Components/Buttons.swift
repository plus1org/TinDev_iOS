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

    var body: some View {
        Button(action: action) {
            Text(title)
                .buttonCommonStyle(font: font,
                                   frameMaxWidth: frameMaxWidth,
                                   foregroundColor: foregroundColor)
                .background(Pallete.mainColor)
                .cornerRadius(15)
        }
        .disabled(disabled)
        .padding(.horizontal)
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
                .background( // MARK: border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Pallete.mainColor, lineWidth: 5)
                )
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
