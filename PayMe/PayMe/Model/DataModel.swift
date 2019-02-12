//
//  DataModel.swift
//  PayMe
//
//  Created by Tomáš Vopat on 12.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CodableFirebase

class DataModel {


    var data = [String: DataDetailModel]()
    private var databaseReference: DatabaseReference!
    var delegate: ModelDelegate!

    init() {

        databaseReference = Database.database().reference().child("workItems")
        databaseReference.observe(.childAdded) { [weak self] snapshot in
            guard let value = snapshot.value else { return }

            if let newItem = try? FirebaseDecoder().decode(DataDetailModel.self, from: value) {
                self?.data[newItem.id!] = newItem
            }
            self?.delegate?.dataChanged()
        }

        databaseReference.observe(.childRemoved) { [weak self] snapshot in
            self?.data.removeValue(forKey: snapshot.key)
            self?.delegate?.dataChanged()
        }
    }

    func createNewDetail() -> DataDetailModel {
        var newDetail = DataDetailModel()
        let newChild = databaseReference.childByAutoId()
        newDetail.id = newChild.key
        return newDetail
    }

    func addData(_ newData: DataDetailModel) {
        var newData = newData
        var newDetail: DatabaseReference!
        if newData.id == nil {
            newDetail = databaseReference.childByAutoId()
            newData.id = newDetail.key
        } else {
            newDetail = databaseReference.child(newData.id!)
        }
        let createdData = try! FirebaseEncoder().encode(newData)
        newDetail.setValue(createdData)
        data[newData.id!] = newData
    }

    func removeData(key: String) {
        data.removeValue(forKey: key)
        databaseReference.child(key).removeValue()
    }

    func get(key: String) -> DataDetailModel? {
        return data[key]
    }

    func getAll() -> [DataDetailModel] {
        return Array(data.values)
    }
}
