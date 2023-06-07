//
//  View+Ext.swift
//

import SwiftUI

extension View {
    func buttonCommonStyle(font: Font, frameMaxWidth: CGFloat, foregroundColor: Color) -> some View {
        self
            .padding()
            .font(font)
            .frame(maxWidth: frameMaxWidth)
            .foregroundColor(foregroundColor)
    }
}
