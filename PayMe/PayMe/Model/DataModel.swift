//
//  DataModel.swift
//  PayMe
//
//  Created by Tomáš Vopat on 12.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import Foundation

class DataModel {
    var data = [String: DataDetailModel]()

    init() {
        for i in 0..<100 {
            var newData = DataDetailModel()
            newData.id = String(i)
            data[String(i)] = newData
        }
    }

    func addData(_ newData: DataDetailModel) {
        if let myId = newData.id {
            data[myId] = newData
        } else {
            // need to generate new ID
            print("Saving failed")
        }
    }

    func removeData(key: String) {
        data.removeValue(forKey: key)
    }

    func get(key: String) -> DataDetailModel? {
        return data[key]
    }

    func getAll() -> [DataDetailModel] {
        return Array(data.values)
    }
}
