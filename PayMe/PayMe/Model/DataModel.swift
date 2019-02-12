//
//  DataModel.swift
//  PayMe
//
//  Created by Tomáš Vopat on 12.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import Foundation

class DataModel {
    var data = [DataDetailModel]()

    init() {
        for _ in 0..<100 {
            data.append(DataDetailModel())
        }
    }

    func addData(_ newData: DataDetailModel) {
        data.append(newData)
    }

    func getAll() -> [DataDetailModel] {
        return data
    }
}
