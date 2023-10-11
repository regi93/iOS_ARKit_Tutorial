//
//  ContentView.swift
//  ARKitTutorialPractice
//
//  Created by 유준용 on 2023/10/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomARViewRepresentable()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
