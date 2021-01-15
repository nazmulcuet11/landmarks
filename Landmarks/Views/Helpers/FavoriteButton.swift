//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Nazmul Islam on 22/12/20.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {

            let imageName = isSet ? "star.fill" : "star"
            let color: Color = isSet ? .yellow : .blue

            Image(systemName: imageName)
                .foregroundColor(color)
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(false))
            .previewLayout(.fixed(width: 100, height: 50))
    }
}
