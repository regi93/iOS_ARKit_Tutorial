//
//  LocationData.swift
//  WhereIsTheConvenienceStore
//
//  Created by 유준용 on 2022/04/16.
//

import Foundation

struct LocationData: Decodable{
    let documents: [KLDocument]
}

struct KLDocument: Decodable{
    let placeName: String
    let addressName: String
    let roadAddressName: String
    let distance: String
    let x: String
    let y: String
    enum CodingKeys: String, CodingKey{
        case x, y, distance
        case placeName = "place_name"
        case addressName = "address_name"
        case roadAddressName = "road_address_name"
    }
}
