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
    
    func configure() {
        
    }
}
