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
    var data: DataDetailModel?

    var delegate: DataDelegate?

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
        switchEditing(enabled: editingEnabled)
    }

    @objc private func editButtonTapped(_ sender: UIButton) {
        switchEditing(enabled: !editingEnabled)
    }

    private func switchEditing(enabled: Bool) {
        editingEnabled = enabled
        for textField in detailView.getAllTextFields() {
            textField.isEnabled = editingEnabled
        }

        if editingEnabled == true {
            editButton.title = "Done"
            editButton.style = .done
        } else {
            editButton.title = "Edit"
            editButton.style = .plain
            if validateData() {
                updateData()
                delegate?.saveData(newData: data!)
            }
        }
    }

    // Vloží data, která se budou zobrazovat
    func showData(data: DataDetailModel, editable: Bool) {
        if self.detailView == nil {
            self.detailView = DataDetailView()
        }
        self.data = data
        updateView()
        self.editingEnabled = editable
    }

    // Zobrazí vložená data
    func updateView() {
        if let newData = data {
            setText(to: "sum", text: String(newData.sum))
            setText(to: "company", text: newData.company)
            setText(to: "hours", text: String(newData.numberOfHours))
            setText(to: "price", text: String(newData.pricePerHour))
            if let description = newData.description {
                setText(to: "description", text: description)
            }
        }
    }

    // Validace dat v polích
    func validateData() -> Bool {
        print("Validace dat")
        return true
    }

    // Uloží data z polí do objektu
    func updateData() {
        if data == nil {
            data = DataDetailModel()
        }
        if let text = getText(from: "company") {
            data!.company = text
        }
        if let text = getText(from: "hours") {
            data!.numberOfHours = Double(text)!
        }
        if let text = getText(from: "price") {
            data!.pricePerHour = Double(text)!
        }
        if let text = getText(from: "sum") {
            if let sum = Double(text) {
                data!.sum = sum
            } else {
                data!.sum = data!.pricePerHour * data!.numberOfHours
            }
        }
        if let text = getText(from: "description") {
            data!.description = text
        }
    }

    // Získá text z pole
    func getText(from field: String) -> String? {
        if let field = detailView.getTextField(name: field) {
            return field.text
        } else {
            return nil
        }
    }

    // Nastaví text v poli
    func setText(to field: String, text: String) {
        if let field = detailView.getTextField(name: field) {
            field.text = text
        }
    }

}
