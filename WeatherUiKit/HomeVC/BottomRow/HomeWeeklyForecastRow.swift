//
//  HomeWeeklyForecastRow.swift
//  WeatherUiKit
//
//  Created by Robert Papp on 2025. 03. 18..
//

import UIKit

class HomeWeeklyForecastRow: UITableViewCell {
    static let id = "HomeWeeklyForecastRow"

    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func configure() {
        
    }
}

extension HomeWeeklyForecastRow : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeeklyForecastDetailRow.id, for: indexPath) as! WeeklyForecastDetailRow
        return cell
    }
}

extension HomeWeeklyForecastRow : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
