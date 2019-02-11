//
//  DataViewController.swift
//  PayMe
//
//  Created by Tomáš Vopat on 11.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import Foundation
import UIKit

class DataViewController: UIViewController {

    var addButton: UIBarButtonItem!

    override func loadView() {
        super.loadView()
        view.backgroundColor = .green

        let addButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addButtonTapped(_:)))
        navigationItem.rightBarButtonItem = addButton
        self.addButton = addButton
    }

    @objc private func addButtonTapped(_ sender: UIButton) {
        let addView = AddDataViewController()
        navigationController?.pushViewController(addView, animated: true)
    }

}

