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

    override init(frame: CGRect) {
        super.init(frame: frame)

        let sumStack = createLabelTextField(labelText: "Sum", editable: false)
        let dateStack = createLabelTextField(labelText: "Date", editable: true)
        let companyStack = createLabelTextField(labelText: "Company", editable: true)
        let hoursStack = createLabelTextField(labelText: "Hours", editable: true)
        let priceStack = createLabelTextField(labelText: "Price per hour", editable: true)
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        let descriptionTextField = UITextField()

        let mainStack = UIStackView(arrangedSubviews: [sumStack, dateStack, companyStack, hoursStack, priceStack, descriptionLabel, descriptionTextField])
        mainStack.axis = .vertical
        mainStack.spacing = 15
        addSubview(mainStack)
        self.mainStack = mainStack

        mainStack.snp.makeConstraints{ make in
            make.leading.top.trailing.equalToSuperview()
        }
    }

    func createLabelTextField(labelText: String, editable: Bool) -> UIStackView {
        let label = UILabel()
        label.text = labelText
        let textField = UITextField()
        textField.isEnabled = editable
        let hStack = UIStackView(arrangedSubviews: [label, textField])
        hStack.axis = .horizontal
        return hStack
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
