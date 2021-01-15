//
//  PageView.swift
//  Landmarks
//
//  Created by Nazmul Islam on 15/1/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State var currentPage: Int = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count) * 18.0)
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        let pages = modelData.featuredLandmarks.map({ FeatureCard(landmark: $0) })

        PageView(pages: pages)
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
