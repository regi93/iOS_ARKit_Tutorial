//
//  ARAction.swift
//  ARKitTutorialPractice
//
//  Created by 유준용 on 2023/10/12.
//

import SwiftUI

// AR과 관련된 모든 작업에 사용되는 열거형을 선언하는 파일
enum ARAction {
    case placeBlock(color: Color)
    case removeAllAnchors
}
