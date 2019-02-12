//
//  DataModel.swift
//  PayMe
//
//  Created by Tomáš Vopat on 11.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import Foundation

struct DataDetailModel: Codable {
    var id: String?
    var sum: Double = 1000
    var date: Double = 12
    var company: String = "Hello"
    var numberOfHours: Double = 1
    var pricePerHour: Double = 100
    var description: String?
}
