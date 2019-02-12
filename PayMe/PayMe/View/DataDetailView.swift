//
//  DataDetailView.swift
//  PayMe
//
//  Created by Tomáš Vopat on 11.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import UIKit
import SnapKit

class DataDetailView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var mainStack: UIStackView!
    var textFields = [String: UITextField]()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        let sumStack = createLabelTextField(labelText: "Sum", editable: false)
        textFields["sum"] = sumStack.1
        let dateStack = createLabelTextField(labelText: "Date", editable: true)
        textFields["date"] = dateStack.1
        let companyStack = createLabelTextField(labelText: "Company", editable: true)
        textFields["company"] = companyStack.1
        let hoursStack = createLabelTextField(labelText: "Hours", editable: true)
        textFields["hours"] = companyStack.1
        let priceStack = createLabelTextField(labelText: "Price per hour", editable: true)
        textFields["price"] = priceStack.1
        let descriptionStack = createLabelTextField(labelText: "Description", editable: true)
        textFields["description"] = descriptionStack.1

        let mainStack = UIStackView(arrangedSubviews: [sumStack.0, dateStack.0, companyStack.0, hoursStack.0, priceStack.0, descriptionStack.0])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        addSubview(mainStack)
        self.mainStack = mainStack

        mainStack.snp.makeConstraints{ make in
            make.leading.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }

    func createLabelTextField(labelText: String, editable: Bool) -> (UIStackView, UITextField) {
        let label = UILabel()
        label.text = labelText
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        let textField = TextField(frame: CGRect(x: 0, y: 0, width: 150, height: 25))
        textField.isEnabled = editable
        let hStack = UIStackView(arrangedSubviews: [label, textField])
        hStack.axis = .vertical
        hStack.spacing = 5
        return (hStack, textField)
    }

    func enableTextFields(_ enable: Bool) {
        for (name, field) in textFields {
            if(name != "sum") {
                field.isEnabled = enable
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
