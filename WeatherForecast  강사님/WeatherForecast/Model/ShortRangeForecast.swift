//
//  ShortRangeForecast.swift
//  WeatherForecast
//
//  Created by Daisy on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

struct ShortRangeForecast {
    let skyCode: String
    let skyName: String
    let temperature: Double
    let date: Date
}


let shortRangeForecastSampleData = """
    {
    "weather": {
    "forecast3days": [
    {
    "grid": {
    "longitude": "127.09776",
    "latitude": "37.11776",
    "city": "경기",
    "county": "오산시",
    "village": "청호동"
    },
    "timeRelease": "2019-06-12 23:00:00",
    "fcst3hour": {
    "wind": {
    "wdir4hour": "180.00",
    "wspd4hour": "0.30",
    "wdir7hour": "195.00",
    "wspd7hour": "1.10",
    "wdir10hour": "150.00",
    "wspd10hour": "0.80",
    "wdir13hour": "270.00",
    "wspd13hour": "0.70",
    "wdir16hour": "297.00",
    "wspd16hour": "1.30",
    "wdir19hour": "302.00",
    "wspd19hour": "2.80",
    "wdir22hour": "314.00",
    "wspd22hour": "2.80",
    "wdir25hour": "265.00",
    "wspd25hour": "1.20",
    "wdir28hour": "243.00",
    "wspd28hour": "1.10",
    "wdir31hour": "307.00",
    "wspd31hour": "1.00",
    "wdir34hour": "304.00",
    "wspd34hour": "1.80",
    "wdir37hour": "298.00",
    "wspd37hour": "2.70",
    "wdir40hour": "306.00",
    "wspd40hour": "2.60",
    "wdir43hour": "288.00",
    "wspd43hour": "2.90",
    "wdir46hour": "297.00",
    "wspd46hour": "2.70",
    "wdir49hour": "265.00",
    "wspd49hour": "1.20",
    "wdir52hour": "",
    "wspd52hour": "",
    "wdir55hour": "",
    "wspd55hour": "",
    "wdir58hour": "",
    "wspd58hour": "",
    "wdir61hour": "",
    "wspd61hour": "",
    "wdir64hour": "",
    "wspd64hour": "",
    "wdir67hour": "",
    "wspd67hour": ""
    },
    "precipitation": {
    "type4hour": "0",
    "prob4hour": "0.00",
    "type7hour": "0",
    "prob7hour": "0.00",
    "type10hour": "0",
    "prob10hour": "0.00",
    "type13hour": "0",
    "prob13hour": "0.00",
    "type16hour": "0",
    "prob16hour": "0.00",
    "type19hour": "0",
    "prob19hour": "0.00",
    "type22hour": "0",
    "prob22hour": "0.00",
    "type25hour": "0",
    "prob25hour": "0.00",
    "type28hour": "0",
    "prob28hour": "0.00",
    "type31hour": "0",
    "prob31hour": "0.00",
    "type34hour": "0",
    "prob34hour": "0.00",
    "type37hour": "0",
    "prob37hour": "0.00",
    "type40hour": "0",
    "prob40hour": "0.00",
    "type43hour": "0",
    "prob43hour": "20.00",
    "type46hour": "0",
    "prob46hour": "20.00",
    "type49hour": "0",
    "prob49hour": "30.00",
    "type52hour": "",
    "prob52hour": "",
    "type55hour": "",
    "prob55hour": "",
    "type58hour": "",
    "prob58hour": "",
    "type61hour": "",
    "prob61hour": "",
    "type64hour": "",
    "prob64hour": "",
    "type67hour": "",
    "prob67hour": ""
    },
    "sky": {
    "code4hour": "SKY_S01",
    "name4hour": "맑음",
    "code7hour": "SKY_S01",
    "name7hour": "맑음",
    "code10hour": "SKY_S01",
    "name10hour": "맑음",
    "code13hour": "SKY_S01",
    "name13hour": "맑음",
    "code16hour": "SKY_S01",
    "name16hour": "맑음",
    "code19hour": "SKY_S01",
    "name19hour": "맑음",
    "code22hour": "SKY_S01",
    "name22hour": "맑음",
    "code25hour": "SKY_S01",
    "name25hour": "맑음",
    "code28hour": "SKY_S01",
    "name28hour": "맑음",
    "code31hour": "SKY_S01",
    "name31hour": "맑음",
    "code34hour": "SKY_S01",
    "name34hour": "맑음",
    "code37hour": "SKY_S01",
    "name37hour": "맑음",
    "code40hour": "SKY_S01",
    "name40hour": "맑음",
    "code43hour": "SKY_S03",
    "name43hour": "구름많음",
    "code46hour": "SKY_S03",
    "name46hour": "구름많음",
    "code49hour": "SKY_S07",
    "name49hour": "흐림",
    "code52hour": "",
    "name52hour": "",
    "code55hour": "",
    "name55hour": "",
    "code58hour": "",
    "name58hour": "",
    "code61hour": "",
    "name61hour": "",
    "code64hour": "",
    "name64hour": "",
    "code67hour": "",
    "name67hour": ""
    },
    "temperature": {
    "temp4hour": "16.00",
    "temp7hour": "15.00",
    "temp10hour": "21.00",
    "temp13hour": "26.00",
    "temp16hour": "28.00",
    "temp19hour": "25.00",
    "temp22hour": "20.00",
    "temp25hour": "18.00",
    "temp28hour": "17.00",
    "temp31hour": "17.00",
    "temp34hour": "20.00",
    "temp37hour": "25.00",
    "temp40hour": "26.00",
    "temp43hour": "24.00",
    "temp46hour": "20.00",
    "temp49hour": "18.00",
    "temp52hour": "",
    "temp55hour": "",
    "temp58hour": "",
    "temp61hour": "",
    "temp64hour": "",
    "temp67hour": ""
    },
    "humidity": {
    "rh4hour": "85.00",
    "rh7hour": "90.00",
    "rh10hour": "65.00",
    "rh13hour": "50.00",
    "rh16hour": "45.00",
    "rh19hour": "50.00",
    "rh22hour": "65.00",
    "rh25hour": "80.00",
    "rh28hour": "85.00",
    "rh31hour": "90.00",
    "rh34hour": "70.00",
    "rh37hour": "55.00",
    "rh40hour": "50.00",
    "rh43hour": "55.00",
    "rh46hour": "65.00",
    "rh49hour": "80.00",
    "rh52hour": "",
    "rh55hour": "",
    "rh58hour": "",
    "rh61hour": "",
    "rh64hour": "",
    "rh67hour": ""
    }
    },
    "fcst6hour": {
    "rain6hour": "없음",
    "rain12hour": "없음",
    "rain18hour": "없음",
    "rain24hour": "없음",
    "rain30hour": "없음",
    "rain36hour": "없음",
    "rain42hour": "없음",
    "rain48hour": "없음",
    "rain54hour": "",
    "snow6hour": "없음",
    "snow12hour": "없음",
    "snow18hour": "없음",
    "snow24hour": "없음",
    "snow30hour": "없음",
    "snow36hour": "없음",
    "snow42hour": "없음",
    "snow48hour": "없음",
    "snow54hour": "",
    "rain60hour": "",
    "rain66hour": "",
    "snow60hour": "",
    "snow66hour": ""
    },
    "fcstdaily": {
    "temperature": {
    "tmax1day": "",
    "tmax2day": "28.00",
    "tmax3day": "26.00",
    "tmin1day": "",
    "tmin2day": "15.00",
    "tmin3day": "16.00"
    }
    }
    }
    ]
    },
    "common": {
    "alertYn": "N",
    "stormYn": "N"
    },
    "result": {
    "code": 9200,
    "requestUrl": "/weather/forecast/3days?appKey=5b3c8415-c24d-4250-926f-ad16cebe50a0&version=2&lat=37.11776&lon=127.09776",
    "message": "성공"
    }
    }
""".data(using: .utf8)!

