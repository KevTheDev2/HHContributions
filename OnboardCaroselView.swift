//
//  OnboardCaroselView.swift
//  VirtualVanguard
//
//  Created by Kevin Gibbs II on 6/7/23.
//

import SwiftUI

struct OnboardCarosel: View {
    @Binding var firstTimeOpeningApp: Bool
    
    init(_ firstTime: Binding<Bool>) {
        _firstTimeOpeningApp = firstTime
    }
    var body: some View {
        TabView {
            OnboardView(systemImageName: "AppLogoDisplay",
                        title: "HarmonyHike",
                        description: "Learn more about the music culture and history of Detroit on this interactive tour. Check in at each stop to receive your rewards.",
                        exitButton: false, firstTimeOpeningApp: $firstTimeOpeningApp)
            OnboardView(systemImageName: "Onboard_Map",
                        title: "Map Screen",
                        description: "Decide where to go based on a visual map with your location.",
                        exitButton: false, firstTimeOpeningApp: $firstTimeOpeningApp)
            OnboardView(systemImageName: "Onboard_List",
                        title: "List Screen",
                        description: "Decide where to go based on an organized list of venues near you.",
                        exitButton: false, firstTimeOpeningApp: $firstTimeOpeningApp)
            OnboardView(systemImageName: "Onboard_Progress",
                        title: "Progress Log",
                        description: "Take a look at where you've visited before and what you haven't seen yet.",
                        exitButton: false, firstTimeOpeningApp: $firstTimeOpeningApp)
//            OnboardView(systemImageName: "gearshape.fill",
//                        title: "Options",
//                        description: "Here you can toggle AR options on or off, checkout the credits/attributes page, or start the walk through over if you want",
//                        exitButton: false, firstTimeOpeningApp: $firstTimeOpeningApp)
            OnboardView(systemImageName: "AppLogoDisplay",
                        title: "Happy Hiking!",
                        description: "Be safe and smart, enjoy visiting, and learning about music venues of the past and present. Onward!",
                        exitButton: true, firstTimeOpeningApp: $firstTimeOpeningApp
            )
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
