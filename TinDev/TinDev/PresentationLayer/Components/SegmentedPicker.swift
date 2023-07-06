//
//  SegmentedPicker.swift
//  TinDev
//
//  Created by M on 05.07.2023.
//

import SwiftUI

struct SegmentedPicker: View {
    private let titles: [String]
    private let selectedItemColor: Color
    private let backgroundColor: Color
    private let selectedItemFontColor: Color
    private let defaultItemFontColor: Color
    private let borderColor: Color
    
    @State private var selectedSegment = 0
    @State private var segmentOffset: CGFloat = 0
    
    init(titles: [String],
         selectedItemColor: Color,
         backgroundColor: Color,
         selectedItemFontColor: Color,
         defaultItemFontColor: Color,
         borderColor: Color) {
        self.titles = titles
        self.selectedItemColor = selectedItemColor
        self.backgroundColor = backgroundColor
        self.selectedItemFontColor = selectedItemFontColor
        self.defaultItemFontColor = defaultItemFontColor
        self.borderColor = borderColor
    }
    
    private func calculateOffset(geometry: GeometryProxy, selectedIndex: Int) -> CGFloat {
        return CGFloat(selectedIndex) * (geometry.size.width / CGFloat(titles.count)) + 1
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(selectedItemColor)
                    .frame(width: (geometry.size.width / CGFloat(titles.count)) - 2, height: 37)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(borderColor, lineWidth: 1))
                    .offset(x: segmentOffset)
                
                HStack {
                    ForEach(titles.indices, id: \.self) { index in
                        Button(action: {
                            withAnimation {
                                selectedSegment = index
                                segmentOffset = calculateOffset(geometry: geometry, selectedIndex: index)
                            }
                        }) {
                            Text(titles[index])
                                .font(Fonts.regular14)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 39)
                                .foregroundColor(selectedSegment == index ? selectedItemFontColor : defaultItemFontColor)
                        }
                    }
                }
            }
            .background(backgroundColor)
            .cornerRadius(12)
            .onAppear {
                segmentOffset = calculateOffset(geometry: geometry, selectedIndex: selectedSegment)
            }
        }
        .frame(maxHeight: 39)
        .cornerRadius(12)
    }
}

struct SegmentedPickerView: View {
    var body: some View {
        VStack {
            Spacer()
            SegmentedPicker(titles: [Localizable.RegestrationModule.standart,Localizable.RegestrationModule.business],
                            selectedItemColor: .white,
                            backgroundColor: .red,
                            selectedItemFontColor: .black,
                            defaultItemFontColor: Pallete.customDarkGray,
                            borderColor: .black)
            .padding()
            Spacer()
        }
    }
    
    struct SegmentedPicker_Previews: PreviewProvider {
        static var previews: some View {
            SegmentedPickerView()
        }
    }
}
