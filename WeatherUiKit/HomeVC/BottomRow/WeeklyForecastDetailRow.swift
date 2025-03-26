//
//  WeeklyForecastDetailRow.swift
//  WeatherUiKit
//
//  Created by Robert Papp on 2025. 03. 21..
//

import UIKit

class WeeklyForecastDetailRow: UITableViewCell {
    static let id = "WeeklyForecastDetailRow"
    
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var highLabel: UILabel!
    @IBOutlet private var lowLabel: UILabel!
    @IBOutlet private var img: UIImageView!
    @IBOutlet private var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure() {
        
    }

}
