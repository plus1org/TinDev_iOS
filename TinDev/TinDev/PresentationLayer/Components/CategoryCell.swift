//
//  CategoryCell.swift
//

import SwiftUI

struct CategoryCell: View {
    var id: UUID
    var name: String
    var selectedId: Binding<UUID?>
    var isExpanded: Binding<Bool>

    var body: some View {
        HStack {
            Text(name)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            if selectedId.wrappedValue == id {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.blue)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(5)
        .onTapGesture {
            selectedId.wrappedValue = id
            isExpanded.wrappedValue.toggle()
        }
    }
}


struct CustomTable: View {
    @State private var categories: [Category] = CategoryData.data
    @State private var selectedId: UUID?

    var body: some View {
        List {
            ForEach($categories.indices, id: \.self) { index in
                CategoryCell(id: categories[index].id, name: categories[index].name, selectedId: $selectedId, isExpanded: $categories[index].isExpanded)
                if categories[index].isExpanded {
                    ForEach(categories[index].subcategories.indices, id: \.self) { subIndex in
                        HStack {
                            Spacer()
                            CategoryCell(id: categories[index].subcategories[subIndex].id,
                                         name: categories[index].subcategories[subIndex].name,
                                         selectedId: $selectedId,
                                         isExpanded: $categories[index].subcategories[subIndex].isExpanded)
                        }
                        if categories[index].subcategories[subIndex].isExpanded {
                            ForEach(categories[index].subcategories[subIndex].subsubcategories.indices, id: \.self) { subSubIndex in
                                HStack {
                                    Spacer()
                                    Spacer()
                                    CategoryCell(id: categories[index].subcategories[subIndex].subsubcategories[subSubIndex].id,
                                                 name: categories[index].subcategories[subIndex].subsubcategories[subSubIndex].name,
                                                 selectedId: $selectedId,
                                                 isExpanded: .constant(false))
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            for index in categories.indices {
                categories[index].isExpanded = false
                for subIndex in categories[index].subcategories.indices {
                    categories[index].subcategories[subIndex].isExpanded = false
                }
            }
        }
        .listStyle(.plain)
    }
}

struct CustomTable_Previews: PreviewProvider {
    static var previews: some View {
        CustomTable()
    }
}

// MARK: - Mock data
struct CategoryData {
    static let data: [Category] = [
        Category(name: "Category 1", subcategories: [
            Subcategory(name: "Subcategory 1", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 1"),
                Subsubcategory(name: "Subsubcategory 2"),
                Subsubcategory(name: "Subsubcategory 3")
            ]),
            Subcategory(name: "Subcategory 2", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 4"),
                Subsubcategory(name: "Subsubcategory 5"),
                Subsubcategory(name: "Subsubcategory 6")
            ]),
            Subcategory(name: "Subcategory 3", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 7"),
                Subsubcategory(name: "Subsubcategory 8"),
                Subsubcategory(name: "Subsubcategory 9")
            ])
        ]),
        Category(name: "Category 2", subcategories: [
            Subcategory(name: "Subcategory 4", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 10"),
                Subsubcategory(name: "Subsubcategory 11"),
                Subsubcategory(name: "Subsubcategory 12")
            ]),
            Subcategory(name: "Subcategory 5", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 13"),
                Subsubcategory(name: "Subsubcategory 14"),
                Subsubcategory(name: "Subsubcategory 15")
            ]),
            Subcategory(name: "Subcategory 6", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 16"),
                Subsubcategory(name: "Subsubcategory 17"),
                Subsubcategory(name: "Subsubcategory 18")
            ])
        ]),
        Category(name: "Category 3", subcategories: [
            Subcategory(name: "Subcategory 7", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 19"),
                Subsubcategory(name: "Subsubcategory 20"),
                Subsubcategory(name: "Subsubcategory 21")
            ]),
            Subcategory(name: "Subcategory 8", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 22"),
                Subsubcategory(name: "Subsubcategory 23"),
                Subsubcategory(name: "Subsubcategory 24")
            ]),
            Subcategory(name: "Subcategory 9", subsubcategories: [
                Subsubcategory(name: "Subsubcategory 25"),
                Subsubcategory(name: "Subsubcategory 26"),
                Subsubcategory(name: "Subsubcategory 27")
            ])
        ])
    ]
}

