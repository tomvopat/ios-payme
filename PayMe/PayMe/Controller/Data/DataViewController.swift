//
//  DataViewController.swift
//  PayMe
//
//  Created by Tomáš Vopat on 11.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import SnapKit
import UIKit

class DataViewController: UITableViewController {

    var addButton: UIBarButtonItem!
    var editButton: UIBarButtonItem!

    override func loadView() {
        super.loadView()

        let addButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addButtonTapped(_:)))
        let editButton = UIBarButtonItem(title: "edit", style: .plain, target: self, action: #selector(editButtonTapped(_:)))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = editButton
        self.addButton = addButton
        self.editButton = editButton
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//    }

    @objc private func addButtonTapped(_ sender: UIButton) {
        let addView = AddDataViewController()
        navigationController?.pushViewController(addView, animated: true)
    }

    @objc private func editButtonTapped(_ sender: UIButton) {
        print("Edit items.")
    }

}

