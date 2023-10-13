//
//  CustomARView.swift
//  ARKitTutorialPractice
//
//  Created by 유준용 on 2023/10/11.
//

import ARKit
import RealityKit
import SwiftUI
import Combine

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder){
        fatalError("init(coder:) has not benn implemented")
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
        subscribeToActionStream()
    }
    
    private var cancellables: Set<AnyCancellable> = []
    private var goldBar: GoldBar.GreenBox? = nil
    
    func subscribeToActionStream(){
        ARManager.shared.actionStream
            .sink {[weak self] action in
                switch action {
                case .placeBlock(let color):
                    self?.placeBlock(ofcolor: color)
                case .placeGoldBar:
                    do {
                        let goldBar = try GoldBar.loadGreenBox()
                        self?.goldBar = goldBar
                        self?.scene.addAnchor(goldBar)
                    }catch {
                        print(error)
                    }
                    
                case .removeAllAnchors:
                    self?.scene.anchors.removeAll()
                case .playGoldBarAnimation:
                    self?.goldBar?.notifications.trigger.post()
                }
            }
            .store(in: &cancellables)
    }
    
    func configureExmaples() {
//        Tracks the device relative to it's environment
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        session.run(configuration)
        // Not supported in all regions, tracks w.r.t. global coordinates
        let _ = ARGeoTrackingConfiguration() // 실제 좌표를 기준으로 객체를 배치 (위도 경도) but.. 특정 지역에서만 지원되는 기능
        
        //Trakcs face in the scene
        let _ = ARFaceTrackingConfiguration()
        
        //Trakcs bodies in the scene
        let _ = ARBodyTrackingConfiguration()
    }
    
    func anchorExamples(){
        /// 예를들어 Anchor를 아이폰 기준으로 앞쪽 3미터, 혹은 위쪽 1미터에 배치할 수 있다.
        /// 사용자나 아이폰의 움직임이 있더라도 그대로 유지된다.
        
        // Attach anchors at specific coordinates in the iphone-centered coordinate system
        let coordinateAnchor = AnchorEntity(world: .zero)
        // Attach anchors to detected planes (this works best on devices with a LIDAR sensor)
        let _ = AnchorEntity(plane: .horizontal)
        let _ = AnchorEntity(plane: .vertical)
        
        // Attach anchors to tracked body parts, such as the face
        let _ = AnchorEntity(.face)
        
        // 이미지를 추적한다 예를들어 visual codes 혹은 markers와 같은..
        let _ = AnchorEntity(.image(group: "그룹", name: "이름"))
        
        // Add an anchor to the scene
        scene.addAnchor(coordinateAnchor)
    }
    
    func entityExamples(){
        
        // Load an entity from a usdz file
        // usdz는 apple에서 만든 파일이며, Apple 개발자 웹사이트에 파일 라이브러리들이 있다.
        let _ = try? Entity.load(named: "usdzfileName")
        
        // Load an entity from a reality file
        let 헬리콥터 = try? Entity.load(named: "hab_en")
        
        // Generate an entity with code
        let box = MeshResource.generateBox(size: 1) // size 단위는 meter이다.
        let entity = ModelEntity(mesh: box) // 이 메쉬 객체에 색상, 질감등을 추가도 할 수 있다.
        

        // add entity to an anchor, so it's placed in the scene
        let anchor = AnchorEntity()
        anchor.addChild(anchor)
    }
    
    
    func placeBlock(ofcolor color: Color){
        let block = MeshResource.generateBox(size: 0.5)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: true)
        let entity = ModelEntity(mesh: block, materials: [material])
        
        
        guard let 헬리콥터 = try? Entity.load(named: "hab_en") else { return }
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(헬리콥터)
        scene.addAnchor(anchor)
    }
    

}
