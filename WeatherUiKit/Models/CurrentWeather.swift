//
//  CurrentWeather.swift
//  WeatherUiKit
//
//  Created by Robert Papp on 2025. 03. 21..
//

import Foundation

struct CurrentWeather : Decodable {
    let coord: Coordinates
    let weather: [CurrentWeatherWeather]
    let base: String
    let main: CurrentWeatherMain
    let visibility: Int
    let wind: CurrentWeatherWind
    let clouds: CurrentWeatherClouds
    let dt: Int
    let sys: CurrentWeatherSys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coordinates : Decodable {
    let long: Double
    let lat: Double
}

struct CurrentWeatherWeather : Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct CurrentWeatherMain: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct CurrentWeatherWind : Decodable{
    let speed: Double
    let deg: Int
}

struct CurrentWeatherClouds: Decodable {
    let all: Int
}

struct CurrentWeatherSys : Decodable{
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}


