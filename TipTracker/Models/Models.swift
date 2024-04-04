//
//  Weeks.swift
//  TipTracker
//
//  Created by Jeremy Beane on 4/1/24.
//

import Foundation

struct Week: Identifiable, Codable {
    var id: String = UUID().uuidString
    var days: [Day]
    
    static var sampleData: [Week] = []
}

struct Day: Identifiable, Codable {
    var id: String = UUID().uuidString
    var weekday: String
    var orders: [Order]
    var mileage: Float = 0.0
}
                

struct Order: Identifiable, Codable {
    var id = UUID().uuidString
    var number: Int
    var tip: Float
    var coins: Float
}
