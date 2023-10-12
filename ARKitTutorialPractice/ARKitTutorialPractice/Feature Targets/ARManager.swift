//
//  ARManager.swift
//  ARKitTutorialPractice
//
//  Created by 유준용 on 2023/10/12.
//

import Combine

class ARManager{
    static let shared = ARManager()
    private init() {}
    
    var actionStream = PassthroughSubject<ARAction, Never>() // observable와 비슷한 개념같음... Never는 이 작업이 실패하지 않는다는것을 알리는 
}
