//
//  ViewController.swift
//  WeatherUiKit
//
//  Created by Robert Papp on 2025. 03. 18..
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var currentWeather: CurrentWeather?
    private var weeklyForecast: WeeklyForecast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        /*
        Api.shared.fetchCurrentWeatherLive { weather in
            guard let weather else { return }
            DispatchQueue.main.async { [weak self] in
                self?.currentWeather  = weather
                self?.tableView.reloadData()
            }
        }
         */
        
        Api.shared.fetchSample(CurrentWeather.self) { weather in
            guard let weather else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                currentWeather = weather
                tableView.reloadData()
            }
        }
        
        Api.shared.fetchSample(WeeklyForecast.self) {
            forecast in
            guard let forecast else { return }
            DispatchQueue.main.async {[weak self] in
                guard let self else { return }
                weeklyForecast = forecast
                tableView.reloadData()
            }
        }
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopRow.id) as! HomeTopRow
                cell.configure(currentWeather)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: HomeCarouselRow.id) as! HomeCarouselRow
                cell.configure(weeklyForecast)
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: HomeWeeklyForecastRow.id) as! HomeWeeklyForecastRow
                return cell
            default:
                return UITableViewCell()
        }
    }
}


extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0:
                return 250
            case 1:
                return 160
            case 2:
                return 330
            default:
                return 0
        }
    }
}
