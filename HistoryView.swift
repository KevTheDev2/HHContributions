//
//  HistoryView.swift
//  VirtualVanguard
//
//  Created by Kevin Gibbs II on 5/18/23.
//

import SwiftUI

struct HistoryView: View {
    @State private var selectedPin: Pin?
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .center) {
                    Text("Where You've Been")
                        .font(.title)
                        .fontWeight(.bold)
                    ForEach(pinCollection) { pin in
                        if UserDefaults.standard.bool(forKey: "\(pin.pinName) Visited") == true { // HAVE VISITED
                            VStack(alignment: .leading) {
                                Divider()
                                    .frame(width: geometry.size.width*0.9, height: geometry.size.width*0.01)
                                    .background(Color("MidAccentColor"))
                                HStack {
                                    Text(pin.pinName)
                                        .padding(.vertical, geometry.size.width*0.02)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Spacer()
                                    Image(systemName: "checkmark.seal.fill")
                                        .font(.system(size: geometry.size.width*0.12))
                                        .foregroundColor(Color("PopAccentColor"))
                                    .accessibilityLabel("Check")                        }
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color("LightAccentColor"))
                                    Image(pin.pinImages)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(geometry.size.width*0.03)
                                        .accessibilityLabel(pin.pinImages)
                                }
                                Text(pin.pinInfo)
                                    .padding(.vertical, geometry.size.width*0.03)
                                HStack {
                                    Button {
                                        selectedPin = pin
                                    } label: {
                                        VStack {
                                            Image(systemName: "cube.transparent")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: geometry.size.width*0.1)
                                            Text("Launch AR")
                                        }
                                    }
                                }
                            }
                        } else {
                        }
                    }
                    Divider()
                        .frame(width: geometry.size.width*0.9, height: geometry.size.width*0.02)
                        .background(Color("PopAccentColor"))
                        .padding(.vertical, geometry.size.width*0.06)
                    Text("What You Still Need To See")
                        .font(.title)
                        .fontWeight(.bold)
                    ForEach(pinCollection) { pin in
                        if UserDefaults.standard.bool(forKey: "\(pin.pinName) Visited") == false { // YET TO VISIT
                            VStack(alignment: .leading) {
                                Divider()
                                    .frame(width: geometry.size.width*0.9, height: geometry.size.width*0.01)
                                    .background(Color("MidAccentColor"))
                                HStack(alignment: .center) {
                                    VStack() {
                                        Text(pin.pinName)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .padding(.vertical, geometry.size.width*0.02)
                                            .lineLimit(nil)
                                            .frame(maxHeight:.infinity)
                                    }
                                    Spacer()
                                    Image(systemName: "circle.dotted")
                                        .font(.system(size: geometry.size.width*0.09))
                                        .accessibilityLabel("Unchecked")
                                        .padding(.vertical, geometry.size.width*0.01)
                                }
                                Text(pin.pinInfoPreview)
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color("LightAccentColor"))
                                        .frame(height: geometry.size.width*0.3)
                                        Image(pin.pinImages)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: geometry.size.width*0.2)
                                            .padding(geometry.size.width*0.03)
                                            .layoutPriority(-1)
                                            .clipped()
                                            .accessibilityLabel(pin.pinImages)
                                            .blur(radius: 3)
                                }
                            }
                        } else {
                        }
                    }
                }
                .padding(.horizontal, geometry.size.width*0.05)
                .sheet(item: $selectedPin) { selectedPin in
                    ARPreviewView(resourceName: selectedPin.venue)
                }
            }
            .background(Color("Background")) // Use a named color asset
        }
        .padding(.vertical, 0.1)
//        .onChange(of: <#T##V#>, perform: <#T##(V) -> Void#>)
    }
}
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
