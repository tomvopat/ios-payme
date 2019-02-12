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

        let dataDetailView: DataDetailView
        if self.detailView == nil {
            dataDetailView  = DataDetailView()
        } else {
            dataDetailView = self.detailView
        }
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
        for textField in detailView.getAllTextFields() {
            textField.isEnabled = editingEnabled
        }
        print("editing: \(editingEnabled)")
    }

    func showData(data: DataDetailModel) {
        if self.detailView == nil {
            self.detailView = DataDetailView()
        }
        setText(to: "sum", text: String(data.sum))
        setText(to: "date", text: String(data.date))
        setText(to: "company", text: data.company)
        setText(to: "hours", text: String(data.numberOfHours))
        setText(to: "price", text: String(data.pricePerHour))
        if let description = data.description {
            setText(to: "description", text: description)
        }
    }

    func getText(from field: String) -> String? {
        if let field = detailView.getTextField(name: field) {
            return field.text
        } else {
            return nil
        }
    }

    func setText(to field: String, text: String) {
        if let field = detailView.getTextField(name: field) {
            field.text = text
        }
    }

}
