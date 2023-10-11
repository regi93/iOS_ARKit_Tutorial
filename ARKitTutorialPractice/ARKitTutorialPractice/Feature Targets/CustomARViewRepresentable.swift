//
//  CustomARViewRepresentable.swift
//  ARKitTutorialPractice
//
//  Created by 유준용 on 2023/10/11.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
}
