//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Nazmul Islam on 15/1/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData

    var categoryNames: [String] {
        return modelData.categories.keys.sorted()
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(categoryNames, id: \.self) {
                    categoryName in

                    CategoryRow(
                        categoryName: categoryName,
                        items: modelData.categories[categoryName] ?? []
                    )
                }
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
