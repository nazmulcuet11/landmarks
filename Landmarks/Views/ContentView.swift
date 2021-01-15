//
//  ContentView.swift
//  Landmarks
//
//  Created by Nazmul Islam on 21/12/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            LandmarkList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
