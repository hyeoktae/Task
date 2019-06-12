//
//  Networking.swift
//  WeatherForecast
//
//  Created by hyeoktae kwon on 2019/06/11.
//  Copyright © 2019 giftbot. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation



class Networking {
    static let shared = Networking()
    
    private let appKey = "c58e8b74-b7f7-4950-abd5-1f7990e06620"
    
    private var lat: String {
        return CurrentLocation.shared.latitude
    }
    
    private var lon: String {
        return CurrentLocation.shared.longitude
    }
    
    private let hourlyUrl = "https://api2.sktelecom.com/weather/current/hourly"
    private let daysUrl = "https://api2.sktelecom.com/weather/forecast/3days"
    
    func downloadWeather(completion: @escaping (Bool) -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.weatherHourly()
            self.weather3days() {
                $0 ? completion(true) : ()
            }
        }
    }
    
    private func weatherHourly() {
        ResultData.shared.reset()
        
        let url = URL(string: "\(hourlyUrl)?appKey=\(appKey)&version&lat=\(lat)&lon=\(lon)")!
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            ResultData.shared.currentWeather = try? JSONDecoder().decode(Weather.self, from: data)
            }.resume()
    }
    
    private func weather3days(completion: @escaping (Bool) -> ()) {
        guard !lat.isEmpty, !lon.isEmpty else { return }
        let url = URL(string: "\(self.daysUrl)?appKey=\(self.appKey)&version&lat=\(self.lat)&lon=\(self.lon)")!
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            guard let weather = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let insideWeather = weather["weather"] as? [String: Any],
                let forecast3days = insideWeather["forecast3days"] as? [Any],
                let fcstBefore = forecast3days[0] as? [String: Any],
                let firstTime = fcstBefore["timeRelease"] as? String,
                let fcst = fcstBefore["fcst3hour"] as? [String: Any],
                let sky = fcst["sky"] as? [String: Any],
                let temp = fcst["temperature"] as? [String: Any]
                else { return }
            
            var hour = 4
            for _ in 0...18 {
                ResultData.shared.skyHour.append(sky["name\(hour)hour"] as? String)
                ResultData.shared.tempHour.append(temp["temp\(hour)hour"] as? String)
                hour += 3
            }
            ResultData.shared.firstTime = firstTime
            completion(true)
            }.resume()
    }
}
