//
//  Onboarding.swift
//  VirtualVanguard
//
//  Created by Kevin Gibbs II on 6/7/23.
//

import SwiftUI
struct OnboardView: View {
    @State var showOnboarding: Bool = true
    let systemImageName: String
    let title: String
    let description: String
    let exitButton: Bool
    @Binding var firstTimeOpeningApp: Bool
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Image(systemImageName)
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, geometry.size.width*0.1)
                        .frame(width: geometry.size.width*0.6)
                    //                    .foregroundColor(.teal)
                    Text(title)
                        .font(.title).bold()
                    Text(description)
                        .multilineTextAlignment(.center)
                    //                    .foregroundColor(.secondary)
                    if exitButton {
                        Button(action: {
                            firstTimeOpeningApp = false
                        }, label: {
                            Text("Let's Start")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(geometry.size.width*0.07)
                                .background(Color("MidAccentColor"))
                                .cornerRadius(geometry.size.width*0.01)
                        })
                    }
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }
    }
}
