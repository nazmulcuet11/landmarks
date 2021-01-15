//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Nazmul Islam on 15/1/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var categoryNames: [String] {
        return modelData.categories.keys.sorted()
    }

    var pages: [FeatureCard] {
        return modelData.featuredLandmarks.map({ FeatureCard(landmark: $0) })
    }

    var body: some View {
        NavigationView {
            List {
                PageView(pages: pages)
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())

                ForEach(categoryNames, id: \.self) {
                    categoryName in
                    
                    CategoryRow(
                        categoryName: categoryName,
                        items: modelData.categories[categoryName] ?? []
                    )
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar {
                Button(action: { showingProfile.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(ModelData())
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
