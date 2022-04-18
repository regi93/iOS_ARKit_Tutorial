//
//  MTMapViewError.swift
//  WhereIsTheConvenienceStore
//
//  Created by 유준용 on 2022/04/18.
//

import Foundation

enum MTMapViewError: Error {
    case failedUpdatingCurrentLocation
    case locationAuthorizationDenied
    var errorDescription: String{
        switch self{
        case .failedUpdatingCurrentLocation:
            return "현재 위치를 불러오지 못했습니다. 잠시 후 다시 시도해주세요."
        case .locationAuthorizationDenied:
            return "위치 정보 권한을 승인해주세요."
        }
    
    }
}
