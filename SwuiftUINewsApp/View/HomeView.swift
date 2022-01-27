//
//  HomeView.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 19/01/2022.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Feed")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
