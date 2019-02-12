//
//  AddDataViewController.swift
//  PayMe
//
//  Created by Tomáš Vopat on 11.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DetailDataViewController: UIViewController {

    var detailView: DataDetailView!
    var editingEnabled: Bool = false
    var editButton: UIBarButtonItem!

    override func loadView() {
        super.loadView()

        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped(_:)))
        navigationItem.rightBarButtonItem = editButton
        self.editButton = editButton

        let dataDetailView = DataDetailView()
        view.addSubview(dataDetailView)
        dataDetailView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        self.detailView = dataDetailView
    }

    @objc private func editButtonTapped(_ sender: UIButton) {
        editingEnabled = !editingEnabled
        detailView.enableTextFields(editingEnabled)
        print("editing: \(editingEnabled)")
    }

}
