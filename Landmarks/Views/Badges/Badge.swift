//
//  Badge.swift
//  Landmarks
//
//  Created by Nazmul Islam on 22/12/20.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8

    var badgeSymbols: some View {
        ForEach(0..<Self.rotationCount) {
            i in

            let angle = (Double(i) / Double(Badge.rotationCount)) * 360.0
            RotatedBadgeSymbol(angle: Angle(degrees: angle))
        }
        .opacity(0.5)
    }

    var body: some View {
        ZStack {
            BadgeBackground()

            GeometryReader {
                (geometry) in

                badgeSymbols
                    .scaleEffect(0.25, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
