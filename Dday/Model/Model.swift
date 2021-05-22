//
//  Model.swift
//  Dday
//
//  Created by 유준용 on 2021/05/16.
//

import Foundation

class Day{
    var userDate : String
    var title : String
//    var d_Day : Int
    
    
    init(userDate : Date, title : String){
        self.title = title
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.userDate = formatter.string(from : userDate)
    }
    
    static var dayList = [Day(userDate : Date(), title : "오늘의 날짜")]

}
