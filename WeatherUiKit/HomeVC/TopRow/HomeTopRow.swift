//
//  HomeTopRow.swift
//  WeatherUiKit
//
//  Created by Robert Papp on 2025. 03. 18..
//

import UIKit

class HomeTopRow: UITableViewCell {
    static let id = "HomeTopRow"
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var highLowLabel: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ weather: CurrentWeather?) {
        guard let weather else { return }
        temperatureLabel.text = "\(weather.main.temp)"
        locationLabel.text = weather.name
        descriptionLabel.text = weather.weather.first?.description
        let low = weather.main.temp_min
        let high = weather.main.temp_max
        highLowLabel.text = "L:\(low) | H:\(high)"
    }
}
