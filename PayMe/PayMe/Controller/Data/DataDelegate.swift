//
//  DataProtocol.swift
//  PayMe
//
//  Created by Tomáš Vopat on 12.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import Foundation

protocol DataDelegate {
    func saveData(newData: DataDetailModel)
}
