//
//  Untitled.swift
//  WeatherUiKit
//
//  Created by Robert Papp on 2025. 03. 25..
//

import Foundation

class Api {
    static let shared = Api()
    private init() {}
    
    // MARK: - Sample data    
    func fetchSample<T: Decodable>(_ type: T.Type, completion: @escaping (T?) -> Void) {
        let resource = getResourceName(type)
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            completion(nil)
            return
        }
        let url = URL(filePath: path)
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try decoder.decode(type, from: data)
            completion(decodedData)
        } catch {
            print(error)
            completion(nil)
        }
    }
    
    private func getResourceName<T>(_ type: T.Type) -> String {
        return switch type{
            case is CurrentWeather.Type:
                    "CurrentWeather"
            case is WeeklyForecast.Type:
                "WeeklyForecast"
            default: ""
        }
    }
    
    // MARK: - Live data
    func fetchCurrentWeatherLive(completion: @escaping (CurrentWeather?)-> Void) {
        let urlStr = "https://api.openweathermap.org/data/2.5/weather?lat=47.4979&lon=19.0402&units=metric&appid=b6907d289e10d714a6e88b3076f44172"
        let url = URL(string: urlStr)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(
                    CurrentWeather.self,
                    from: data)
                completion(decodedData)
            } catch {
                print(error)
                completion(nil)
            }
        }
        task.resume()
    }
}
