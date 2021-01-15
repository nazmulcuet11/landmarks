//
//  ContentView.swift
//  Landmarks
//
//  Created by Nazmul Islam on 21/12/20.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case featured
        case list
    }

    @EnvironmentObject var modelData: ModelData
    @State private var selectedTab: Tab = .featured

    var body: some View {
        TabView(selection: $selectedTab) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
