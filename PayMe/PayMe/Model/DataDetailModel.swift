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
    var time: Double
    var numberOfHours: Double
    var pricePerHour: Double
    var description: String?
}
