//
//  CategoryModel.swift
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    var name: String
    var subcategories: [Subcategory]
    var isExpanded: Bool = false
}

struct Subcategory: Identifiable {
    let id = UUID()
    var name: String
    var subsubcategories: [Subsubcategory]
    var isExpanded: Bool = false
}

struct Subsubcategory: Identifiable {
    let id = UUID()
    var name: String
}
