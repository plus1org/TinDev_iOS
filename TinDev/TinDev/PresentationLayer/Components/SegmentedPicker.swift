//
//  SegmentedPicker.swift
//  TinDev
//
//  Created by M on 05.07.2023.
//

import SwiftUI

struct SegmentedPicker: View {
    
    @State private var  selection = 0
    @State private var frames = Array<CGRect>(repeating: .zero, count: 20)
    
    private let titles: [String]
    private let selectedItemColor: Color
    private let backgroundColor: Color
    private let selectedItemFontColor: Color
    private let defaultItemFontColor: Color
    
    init (titles: [String], selectedItemColor: Color, backgroundColor: Color, selectedItemFontColor: Color, defaultItemFontColor: Color) {
        self.titles = titles
        self.selectedItemColor = selectedItemColor
        self.backgroundColor = backgroundColor
        self.selectedItemFontColor = selectedItemFontColor
        self.defaultItemFontColor = defaultItemFontColor
    }
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 10) {
                    ForEach(self.titles.indices, id: \.self) { index in
                        Text(self.titles[index])
                            .foregroundColor(selection == index ? selectedItemFontColor : defaultItemFontColor)
                            .onTapGesture{
                                self.selection = index
                            }
                            .padding()
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
                .background(alignment: .leading) {
                    Capsule()
                        .fill(selectedItemColor)
                        .frame(width: self.frames[self.selection].width, height: 54)
                        .offset(x: self.frames[self.selection].minX - self.frames[0].minX)
                }
                .padding(5)
                
            }
            .background(backgroundColor)
            .animation(.spring(), value: selection)
        }
        .cornerRadius(100)
        .padding()
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
            SegmentedPicker(titles: ["one","two"], selectedItemColor: Pallete.mainColor, backgroundColor: Pallete.customGray, selectedItemFontColor: .white, defaultItemFontColor: .black)
        }
    }
}

struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPickerView()
    }
}
