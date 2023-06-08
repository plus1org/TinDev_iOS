//
//  Buttons.swift
//

import SwiftUI

struct RegularButtons: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                SolidButton(action: {},
                            title: "Solid Button",
                            disabled: false,
                            font: .headline,
                            frameMaxWidth: .infinity,
                            foregroundColor: Color.black
                )
                BorderButton(action: {},
                             title: "Border Button",
                             disabled: false,
                             font: .headline,
                             frameMaxWidth: .infinity,
                             foregroundColor: .purple
                )
                DisabledButton(action: {},
                               title: "Disabled Button",
                               disabled: true,
                               font: .headline,
                               frameMaxWidth: .infinity,
                               foregroundColor: Color.black
                )
                BorderlessButton(action: {},
                                 title: "Borderless Button",
                                 disabled: false,
                                 font: .headline,
                                 frameMaxWidth: .infinity,
                                 foregroundColor: .gray
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
                .background(Color.purple)
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
                        .stroke(Color.purple, lineWidth: 5)
                )
        }
        .disabled(disabled)
        .padding(.horizontal)
    }
}

struct DisabledButton: View {
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
                .background(Color.gray)
                .cornerRadius(15)
        }
        .disabled(disabled)
        .padding(.horizontal)
    }
}

struct BorderlessButton: View {
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
        }
        .disabled(disabled)
        .padding(.horizontal)
    }
}

struct LinearGradientButton: View {
    var action: () -> Void
    // MARK: - settings for gradient - any colors in initialization, start and end - .topLeading .bottom and so on
    var title: String
    var disabled: Bool
    var font: Font
    var frameMaxWidth: CGFloat
    var foregroundColor: Color
    var gradientColors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint

    var body: some View {
        Button(action: action) {
            Text(title)
                .buttonCommonStyle(font: font,
                                   frameMaxWidth: frameMaxWidth,
                                   foregroundColor: foregroundColor)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(gradient: Gradient(colors: gradientColors), //array of colors
                                             startPoint: startPoint,  //from
                                             endPoint: endPoint))     //to
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


// MARK: - modificatore
