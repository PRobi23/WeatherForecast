//
//  DailyForecastCell.swift
//  WeatherUiKit
//
//  Created by Robert Papp on 2025. 03. 21..
//

import UIKit

class DailyForecastCell: UICollectionViewCell {
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    static let id = "DailyForecastCell"
    
    func configure(_ item: WeeklyForecastList) {
        timeLabel.text = item.dt_txt
        temperatureLabel.text = "\(String(describing: item.main?.temp))°C"
    }
}
