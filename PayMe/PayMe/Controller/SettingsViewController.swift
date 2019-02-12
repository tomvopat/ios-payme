//
//  SettingsViewController.swift
//  PayMe
//
//  Created by Tomáš Vopat on 11.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SettingViewController: UIViewController {

    let data: DataModel?
    var targetField: UITextField!

    init(data: DataModel?) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()

        view.backgroundColor = .white

        let targetLabel = UILabel()
        targetLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        targetLabel.text = "Target sum"
        view.addSubview(targetLabel)
        targetLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }

        let targetField = TextField()
        targetField.keyboardType = .numbersAndPunctuation
        targetField.textAlignment = .center
        view.addSubview(targetField)
        targetField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(targetLabel.snp.bottom).offset(10)
            make.width.greaterThanOrEqualTo(150)
        }
        targetField.addTarget(self, action: #selector(targetChanged(_:)), for: .editingDidEnd)
        if let target = data?.target {
            targetField.text = String(target)
        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)

        self.targetField = targetField

    }

    @objc private func targetChanged(_ sender: UITextField) {
        if let input = targetField.text {
            if let doubleInput: Double = Double(input) {
                data?.updateTarget(newTarget: doubleInput)
            }
        }
    }

    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        self.targetField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
}
