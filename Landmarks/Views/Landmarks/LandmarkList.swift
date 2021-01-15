//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Nazmul Islam on 21/12/20.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter({ !showFavoritesOnly || $0.isFavorite })
    }

    var body: some View {
        List {
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites only")
            }

            ForEach(filteredLandmarks) {
                (landmark) in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) {
//            (deviceName) in
//
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }

        LandmarkList()
            .environmentObject(ModelData())
    }
}
