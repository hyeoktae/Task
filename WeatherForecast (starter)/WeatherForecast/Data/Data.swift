//
//  Data.swift
//  WeatherForecast
//
//  Created by hyeoktae kwon on 2019/06/11.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

var visibleFirstCell = false

class CurrentLocation {
    static let shared = CurrentLocation()
    
    private init() {}
    
    var latitude: String = ""
    var longitude: String = ""
}

class ResultData {
    static let shared = ResultData()
    
    var currentWeather: Weather? = nil
    var skyHour = [String?]()
    var tempHour = [String?]()
    var firstTime: String? = nil
    
    func getGrid() -> Grid? {
        return (currentWeather?.weather?.hourly?[0].grid)
    }
    
    func getSky() -> Sky? {
        return (currentWeather?.weather?.hourly?[0].sky)
    }
    
    func getTemp() -> Temperature? {
        return (currentWeather?.weather?.hourly?[0].temperature)
    }
    
    func reset() {
        firstTime = nil
        currentWeather = nil
        skyHour = []
        tempHour = []
    }
    
}


class CurrentTime {
    static let shared = CurrentTime()
    
    private init(){}
    // 현재 시간은 계산porperty로 선언 할 때 마다 갱신
    private var now: Date {
        return Date()
    }
    
    private let date = DateFormatter()
    
    func nowTime() -> String {
        date.locale = Locale(identifier: "ko_kr")
        date.timeZone = TimeZone(abbreviation: "KST")
        date.dateFormat = "a hh:mm"
        
        return date.string(from: now)
    }
}

// MARK: - Weather
struct Weather: Codable {
    let weather: WeatherClass?
}

// MARK: - WeatherClass
struct WeatherClass: Codable {
    let hourly: [Hourly]?
}

// MARK: - Hourly
struct Hourly: Codable {
    let grid: Grid?
    let sky: Sky?
    var temperature: Temperature?
}

// MARK: - Grid
struct Grid: Codable {
    let city, county, village: String?
}

// MARK: - Sky
struct Sky: Codable {
    let name: String?
}

// MARK: - Temperature
struct Temperature: Codable {
    var tc: String?
    var tmax: String?
    var tmin: String?
}
