//
//  ForecastType.swift
//  WeatherForecast
//
//  Created by hyeoktae kwon on 2019/06/13.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

// caseInterable: enum type안에 case들이 순서대로 나옴
enum ForecastType: Int, CaseIterable {
    case current
    case shortRange
}

func test() {
    print(ForecastType.allCases.count)
    for i in ForecastType.allCases {
        print(i)
    }
}
