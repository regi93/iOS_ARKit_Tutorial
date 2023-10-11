//
//  CustomARView.swift
//  ARKitTutorialPractice
//
//  Created by 유준용 on 2023/10/11.
//

import ARKit
import RealityKit
import SwiftUI

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder){
        fatalError("init(coder:) has not benn implemented")
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
    }
}
