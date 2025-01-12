//
//  RootView.swift
//  VirtualVanguard
//
//  Created by Kevin Gibbs II on 6/8/23.
//

import SwiftUI

struct RootView: View {
    @AppStorage("firstTimeOpeningApp") var firstTimeOpeningApp = true
    var body: some View {
        if firstTimeOpeningApp {
            OnboardCarosel($firstTimeOpeningApp)
        } else {
            TabBar()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
