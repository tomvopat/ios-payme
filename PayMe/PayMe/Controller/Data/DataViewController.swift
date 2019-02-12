//
//  DataViewController.swift
//  PayMe
//
//  Created by Tomáš Vopat on 11.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import SnapKit
import UIKit

class DataViewController: UITableViewController, DataDelegate {

    func saveData(newData: DataDetailModel) {
        data?.addData(newData)
        tableView.reloadData()
    }

    let data: DataModel?

    var addButton: UIBarButtonItem!
    let cellIdentifier = "cellIdentifier"

    init(data: DataModel?) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()

        let addButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addButtonTapped(_:)))
        navigationItem.rightBarButtonItem = addButton
        self.addButton = addButton
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let myData = data {
            return myData.getAll().count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        if let myData = data {
            let exactData = myData.getAll()[indexPath.row]
            cell!.textLabel?.text = String(exactData.sum)
            cell!.detailTextLabel?.text = String(exactData.date)
        }
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let myData = data {
            let exactData = myData.getAll()[indexPath.row]
            openDetail(data: exactData)
        }
    }

    private func openDetail(data: DataDetailModel) {
        let detailView = DetailDataViewController()
        detailView.delegate = self
        detailView.showData(data: data)
        navigationController?.pushViewController(detailView, animated: true)
    }

    @objc private func addButtonTapped(_ sender: UIButton) {
        print("Create new data.")

    }



}

