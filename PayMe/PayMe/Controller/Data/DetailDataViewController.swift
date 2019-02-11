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

    override func loadView() {
        super.loadView()
        view.backgroundColor = .yellow

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

}
