//
//  ViewController.swift
//  TestBeacon
//
//  Created by hyeoktae kwon on 2019/06/24.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController {
    
    let stateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 100, height: 200))
        return label
    }()
    
    var locationManager: CLLocationManager!
    var beacon: CLBeacon!
    var beaconRegion: CLBeaconRegion!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocation()
    }
    
    
    func setupLocation() {
        super.viewDidLoad()
        locationManager = CLLocationManager.init()              // locationManager 초기화.
        locationManager.delegate = self                         // 델리게이트 넣어줌.
        locationManager.requestAlwaysAuthorization()            // 위치 권한 받아옴.
        
        locationManager.startUpdatingLocation()                 // 위치 업데이트 시작
        locationManager.allowsBackgroundLocationUpdates = true  // 백그라운드에서도 위치를 체크할 것인지에 대한 여부. 필요없으면 false로 처리하자.
        locationManager.pausesLocationUpdatesAutomatically = false  // 이걸 써줘야 백그라운드에서 멈추지 않고 돈다
    
    }


}


extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            monitorBeacons()
        }
    }
    
    func monitorBeacons() {
        if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
            beaconRegion.notifyEntryStateOnDisplay = true
            beaconRegion.notifyOnExit = true
            beaconRegion.notifyOnEntry = true
            locationManager.startMonitoring(for: beaconRegion)
        } else {
            print("CLLoacation Monitoring is unavailable")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        if state == .inside {
            
        } else if state == .outside {
            
        } else if state == .unknown {
            print("Now unknown of Region")
        }
    }
    
}

