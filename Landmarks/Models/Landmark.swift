//
//  Landmark.swift
//  Landmarks
//
//  Created by Nazmul Islam on 21/12/20.
//

import Foundation
import SwiftUI
import MapKit

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var featuredImageName: String { imageName.appending("_feature") }
    var featuredImage: Image? {
        isFeatured ? Image(featuredImageName) : nil
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }

    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
