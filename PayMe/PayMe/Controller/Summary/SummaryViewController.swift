//
//  ViewController.swift
//  PayMe
//
//  Created by Tomáš Vopat on 10.F.19.
//  Copyright © 2019 Tomáš Vopat. All rights reserved.
//

import UIKit
import SnapKit
import Charts

class SummaryViewController: UIViewController, SummaryDelegate {

    let data: DataModel?
    var chartView: PieChartView!
    var sumLabel: UILabel!
    var lastItemLabel: UILabel!

    init(data: DataModel?) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
        data?.summaryDelegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white

        let chartView = PieChartView()
        chartView.backgroundColor = UIColor.black
        chartView.holeColor = UIColor.clear
        chartView.chartDescription?.textColor = UIColor.white
        chartView.legend.textColor = UIColor.white
        view.addSubview(chartView)
        chartView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-10)
        }
        self.chartView = chartView

        let hLine = UIView()
        hLine.backgroundColor = .black
        view.addSubview(hLine)
        hLine.snp.makeConstraints { make in
            make.top.equalTo(chartView.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(3)
        }

        let sumLabel = UILabel()
        sumLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        sumLabel.text = "Sum"
        view.addSubview(sumLabel)
        sumLabel.snp.makeConstraints { make in
            make.top.equalTo(hLine.snp.bottom).offset(10)
            make.center.equalToSuperview()
        }
        self.sumLabel = sumLabel

        let hLine2 = UIView()
        hLine2.backgroundColor = .black
        view.addSubview(hLine2)
        hLine2.snp.makeConstraints { make in
            make.top.equalTo(sumLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(3)
        }

        let lastLabel = UILabel()
        lastLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
        lastLabel.text = "Last"

        let lastItemLabel = UILabel()
        lastItemLabel.font = UIFont(name: "Helvetica", size: 17)
        lastItemLabel.text = "price"
        self.lastItemLabel = lastItemLabel
        
        let hStack = UIStackView(arrangedSubviews: [lastLabel, lastItemLabel])
        hStack.axis = .horizontal
        hStack.spacing = 10
        view.addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.top.equalTo(hLine2.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataChanged()

    }

    func dataChanged() {
        if self.data == nil {
            return
        }
        let allData = self.data!.getAll()

        pieChartUpdate(allData)
        sumUpdate(allData)
        lastUpdate(allData)
    }

    func sumUpdate(_ allData: [DataDetailModel]) {
        var sum: Double = 0
        for item in allData {
            sum += item.sum
        }
        sumLabel.text = "Sum: \(sum) CZK"
    }

    func lastUpdate(_ allData: [DataDetailModel]) {
        if let last = allData.last {
            lastItemLabel.text = "\(last.sum) by \(last.company)"
        } else {
            lastItemLabel.text = "None 😞"
        }

    }

    func pieChartUpdate(_ allData: [DataDetailModel]) {
        var companyPrice = [String: Double]()
        for item in allData {
            let current = companyPrice[item.company]
            if current == nil {
                companyPrice[item.company] = item.sum
            } else {
                companyPrice[item.company] = item.sum + current!
            }
        }

        var entries = [PieChartDataEntry]()
        for (company, price) in companyPrice {
            let entry = PieChartDataEntry(value: price, label: company)
            entries.append(entry)
        }

        let dataSet = PieChartDataSet(values: entries, label: "Companies")
        dataSet.valueColors = [UIColor.black]
        dataSet.colors = ChartColorTemplates.joyful()
        let data = PieChartData(dataSet: dataSet)
        
        chartView.data = data
        chartView.chartDescription?.text = "Share of money by Company"
    }

}

