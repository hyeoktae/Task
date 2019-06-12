//
//  WeatherVC.swift
//  WeatherForecast
//
//  Created by hyeoktae kwon on 2019/06/11.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit
import CoreLocation

final class WeatherVC: UIViewController {
    
//    let blur = UIBlurEffect(style: UIBlurEffect.Style.init(rawValue: 3)!)
    private let blur = (NSClassFromString("_UICustomBlurEffect") as! UIBlurEffect.Type).init()
    
    var blurView = UIVisualEffectView(effect: nil)
    
    var locationManager = CLLocationManager()
    
    var timeInterval = -18000
    
    var firstDateArr: [Date?]? = []
    
    var firstDate: Date {
        get {
            return firstFormat.date(from: ResultData.shared.firstTime ?? "0000-00-00 00:00:00")!
        }
    }
    
    var locationText: String? {
        willSet(new) {
            self.locationLabel.text = new
        }
    }
    
    let firstFormat: DateFormatter = {
        let format = DateFormatter()
        format.timeZone = TimeZone(abbreviation: "UTC")
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return format
    }()
    
    let dateFormat: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "M.dd (EEE)"
        return format
    }()
    
    let timeFormat: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        return format
    }()
    
    var locationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 190, height: 20))
        label.textAlignment = .center
        label.textColor = .white
        label.font = label.font.withSize(18)
        label.text = "\(ResultData.shared.getGrid()?.city ?? "")"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 20, width: 190, height: 20))
        label.textAlignment = .center
        label.textColor = .white
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var refreshBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "refresh"), for: .normal)
        btn.addTarget(self, action: #selector(refresh(_:)), for: .touchUpInside)
        btn.isEnabled = false
        return btn
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backImg: UIImageView = {
        let view = UIImageView(frame: UIScreen.main.bounds)
        view.image = UIImage(named: "backImg4")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    var tblView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor.init(white: 0, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(TopCell.self, forCellReuseIdentifier: "topCell")
        view.register(OtherCell.self, forCellReuseIdentifier: "otherCell")
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLocationManager()
        addSubViews()
        autoLayout()
        setupBlurView()
        tblView.separatorInset = UIEdgeInsets(top: 0, left: view.center.x - 10, bottom: 0, right: view.center.x - 70)
        tblView.separatorColor = .white
        tblView.dataSource = self
        tblView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.global().async {
            sleep(1)
            Networking.shared.downloadWeather() {
                $0 ? DispatchQueue.main.async {
                    self.tblView.reloadData()
                    self.timeLabel.text = "\(CurrentTime.shared.nowTime())"
                    self.makeDateArr()
                    self.refreshBtn.isEnabled = true
                    self.locationText = "\(ResultData.shared.getGrid()?.county ?? "") \(ResultData.shared.getGrid()?.village ?? "")"
                    } : ()
            }
        }
    }
    
    private func setupBlurView() {
        blur.setValue(1, forKey: "blurRadius")
        blurView.frame = UIScreen.main.bounds
        
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @objc private func refresh(_ sender: UIButton) {
        self.refreshBtn.isEnabled = false
        tblView.beginUpdates()
        timeInterval = -18000
        firstDateArr = []
        DispatchQueue.global().async {
            Networking.shared.downloadWeather() {
                $0 ? DispatchQueue.main.async {
                    self.tblView.reloadData()
                    self.makeBackImg()
                    self.timeLabel.text = "\(CurrentTime.shared.nowTime())"
                    self.makeDateArr()
                    self.refreshBtn.isEnabled = true
                    self.tblView.endUpdates()
                    guard let county = ResultData.shared.getGrid()?.county, let village = ResultData.shared.getGrid()?.village else { return }
                    self.locationText = "\(county) \(village)"
                    } : ()
            }
        }
        
    }
    
    private func addSubViews() {
        let views = [tblView, backImg, topView, blurView]
        let topProperties = [locationLabel, timeLabel, refreshBtn]
//        backImg.addSubview(blurView)
        views.forEach { view.addSubview($0) }
        topProperties.forEach { topView.addSubview($0) }
        view.bringSubviewToFront(tblView)
        view.bringSubviewToFront(topView)
    }

    // location 받아오기
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
    }
    
    private func makeBackImg() {
        let num = (1...4).randomElement()!
        backImg.image = UIImage(named: "backImg\(num)")
    }
    
    // after download!!!
    private func makeDateArr() {
        for _ in (0 ..< ResultData.shared.skyHour.filter { $0 != "" }.count) {
            let calculationDate = Date(timeInterval: TimeInterval(timeInterval), since: firstDate)
            firstDateArr?.append(calculationDate)
            timeInterval += 10800
        }
        
    }
    
    private func autoLayout() {
        locationLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        locationLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        
        timeLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5).isActive = true
        
        refreshBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        refreshBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10).isActive = true
        refreshBtn.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.1).isActive = true
        refreshBtn.heightAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.1).isActive = true
        
        topView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tblView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tblView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tblView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9).isActive = true
    }
    // hide notch
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension WeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 위치 업데이트 할 때 마다
        guard let location = manager.location?.coordinate else { return }
        CurrentLocation.shared.latitude = String(location.latitude)
        CurrentLocation.shared.longitude = String(location.longitude)
    }
}

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResultData.shared.skyHour.filter { $0 != "" }.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tblView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! TopCell
            
            cell.backgroundColor = .clear
            cell.selectedBackgroundView = UIView()
            
            guard let tmin = ResultData.shared.getTemp()?.tmin?.dropLast(3),
                  let tmax = ResultData.shared.getTemp()?.tmax?.dropLast(3),
                  let tc = ResultData.shared.getTemp()?.tc?.dropLast(1)
                  else { return cell }
            
            cell.weatherLabel.text = "맑음"
            cell.minTemp.text = "\(tmin)º"
            cell.minIcon.text = "⍗"
            cell.maxTemp.text = "\(tmax)º"
            cell.maxIcon.text = "⍐"
            cell.tempLabel.text = "\(tc)º"
            cell.weatherIcon.image = UIImage(named: ResultData.shared.getSky()?.name ?? "맑음")
            cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
            return cell
        } else {
            
            
            let cell = tblView.dequeueReusableCell(withIdentifier: "otherCell", for: indexPath) as! OtherCell
            
            cell.backgroundColor = .clear
            cell.selectedBackgroundView = UIView()
            
            guard let temp = ResultData.shared.tempHour[indexPath.row - 1]?.dropLast(3) else { return cell }
            visibleFirstCell = false
            cell.date.text = dateFormat.string(from: firstDateArr?[indexPath.row - 1] ?? Date())
            cell.time.text = timeFormat.string(from: firstDateArr?[indexPath.row - 1] ?? Date())
            cell.temp.text = "\(temp)º"
            cell.sky.image = UIImage(named: ResultData.shared.skyHour[indexPath.row - 1] ?? "맑음")
            
            timeInterval += 10800
            return cell
        }
    }
}

extension WeatherVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return tblView.frame.height
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 100 {
            visibleFirstCell = false
        } else {
            visibleFirstCell = true
        }
        
        if visibleFirstCell {
            UIView.animate(withDuration: 1) {
                self.blurView.effect = self.blur
                self.backImg.center.x = 257
                self.blurView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            }
            
        } else {
            UIView.animate(withDuration: 1) {
                self.blurView.effect = nil
                self.backImg.center.x = 207
                self.blurView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            }
            
        }
        view.setNeedsUpdateConstraints()
    }
}

