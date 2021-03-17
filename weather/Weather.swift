//
//  Weather.swift
//  weather
//
//  Created by Scott Courtney on 3/16/21.
//

import Foundation

struct WeatherResult: Codable {
    let list: [Lists]
}

struct Lists: Codable {
    let weather: [Weathers]
    let visibility: Int
    let pop: Double
    let main: Mains
    let dt_txt: String
    let wind: Winds
}
struct Weathers: Codable {
    let description: String
    let main: String
    let icon: String
    let id: Int
}

struct Mains: Codable {
    let temp_kf: Double
    let temp_max: Double
    let humidity: Int
    let grnd_level: Int
    let feels_like: Double
    let temp_min: Double
    let pressure: Int
    let sea_level: Int
    let temp: Double
}

struct Winds: Codable {
    let speed: Double
    let deg: Int
}

