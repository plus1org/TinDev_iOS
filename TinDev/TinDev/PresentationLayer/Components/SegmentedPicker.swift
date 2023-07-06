//
//  SegmentedPicker.swift
//  TinDev
//
//  Created by M on 05.07.2023.
//

import SwiftUI

struct SegmentedPicker: View {
    
    @State private var selection = 0
    @State private var frames = Array<CGRect>(repeating: .zero, count: 5)
    
    private let titles: [String]
    private let selectedItemColor: Color
    private let backgroundColor: Color
    private let selectedItemFontColor: Color
    private let defaultItemFontColor: Color
    private let borderColor: Color
    
    init(titles: [String], selectedItemColor: Color, backgroundColor: Color, selectedItemFontColor: Color, defaultItemFontColor: Color, borderColor: Color = .gray) {
        self.titles = titles
        self.selectedItemColor = selectedItemColor
        self.backgroundColor = backgroundColor
        self.selectedItemFontColor = selectedItemFontColor
        self.defaultItemFontColor = defaultItemFontColor
        self.borderColor = borderColor
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    HStack(spacing: 11) {
                        ForEach(self.titles.indices, id: \.self) { index in
                            Button(action: {
                                self.selection = index
                            }) {
                                Text(self.titles[index])
                                    .foregroundColor(selection == index ? selectedItemFontColor : defaultItemFontColor)
                                    .font(Fonts.regular14)
                                    .frame(maxWidth: .infinity)
                                    .background {
                                        GeometryReader { geo in
                                            Color.clear.onAppear{
                                                self.setFrame(index: index, frame: geo.frame(in: .global))
                                            }
                                        }
                                    }
                            }
                        }
                    }
                    .frame(height: 38)
                    .padding(2)
                    .background(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(selectedItemColor)
                            .frame(width: self.frames[self.selection].width, height: 38 - 2)
                            .offset(x: self.frames[self.selection].minX - self.frames[0].minX)
                            .padding(.leading, 1)
                    }
                    .background(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderColor, lineWidth: 1)
                            .frame(width: self.frames[self.selection].width, height: 38 - 2)
                            .offset(x: self.frames[self.selection].minX - self.frames[0].minX)
                            .padding(.leading, 1)
                    }
                }
                .background(backgroundColor)
                .animation(.spring(), value: selection)
            }
            .cornerRadius(12)
            .padding()
        }
        .frame(maxHeight: 38)
    }
    
    private func setFrame(index: Int, frame: CGRect) {
        DispatchQueue.main.async {
            self.frames[index] = frame
        }
    }
}

struct SegmentedPickerView: View {
    var body: some View {
        VStack {
            Spacer()
            SegmentedPicker(titles: ["Стандартный","Бизнес-аккаунт"], selectedItemColor: .white, backgroundColor: Pallete.customGray, selectedItemFontColor: .black, defaultItemFontColor: .black, borderColor: .black)
            Spacer()
        }
    }
    
    struct SegmentedPicker_Previews: PreviewProvider {
        static var previews: some View {
            SegmentedPickerView()
        }
    }
}
