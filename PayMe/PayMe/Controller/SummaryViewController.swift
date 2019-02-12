//
//  ViewController.swift
//  PayMe
//
//  Created by Tomáš Vopat on 10.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import UIKit
import SnapKit

class SummaryViewController: UIViewController {

    let data: DataModel?

    init(data: DataModel?) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

}

