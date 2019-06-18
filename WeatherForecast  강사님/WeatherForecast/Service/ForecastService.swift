//
//  ForecastService.swift
//  WeatherForecast
//
//  Created by hyeoktae kwon on 2019/06/13.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

class ForecastService: ForecastServiceType {
    func fetchCurrentForecast(latitude: Double, longitude: Double, completionHandler: @escaping (Result<CurrentForecast, ServiceError>) -> Void) {
        ()
    }
    
    func fetchShortRangeForecast(latitude: Double, longitude: Double, completionHandler: @escaping (Result<[ShortRangeForecast], ServiceError>) -> Void) {
        ()
    }
    
    
}
