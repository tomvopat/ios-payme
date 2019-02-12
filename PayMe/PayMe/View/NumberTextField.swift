//
//  NumberTextField.swift
//  PayMe
//
//  Created by Tomáš Vopat on 12.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import UIKit

extension UITextFieldDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.letters) == nil
    }

    

}
