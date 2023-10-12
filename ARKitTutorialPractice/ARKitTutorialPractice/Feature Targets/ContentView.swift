//
//  ContentView.swift
//  ARKitTutorialPractice
//
//  Created by 유준용 on 2023/10/11.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [
        .green,
        .yellow,
        .blue,
        .black,
        .red
    ]
    var body: some View {
        CustomARViewRepresentable()
            .ignoresSafeArea()
            .overlay(alignment: .bottom){
                ScrollView(.horizontal){
                    HStack{
                        Button{
                            ARManager.shared.actionStream.send(.removeAllAnchors)
                        }label: {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                        }
                        
                        ForEach(colors, id: \.self){ color in
                            Button{
                                ARManager.shared.actionStream.send(.placeBlock(color: color))
                            }label: {
                                color
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(.regularMaterial)
                            }
                        }
                        
                    }
                    .padding()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
