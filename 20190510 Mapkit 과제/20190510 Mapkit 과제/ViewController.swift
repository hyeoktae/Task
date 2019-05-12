//
//  ViewController.swift
//  20190510 Mapkit 과제
//
//  Created by hyeoktae kwon on 12/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var destinations = [CLLocationCoordinate2D]()
    
    var backView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.9803583026, green: 0.9803673625, blue: 0.9845872521, alpha: 1)
        v.layer.borderWidth = 1
        v.layer.borderColor = #colorLiteral(red: 0.7714042866, green: 0.7741157294, blue: 0.7822500576, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var addTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.font = tf.font?.withSize(25)
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 5
        tf.layer.borderColor = #colorLiteral(red: 0.9145414233, green: 0.9096133709, blue: 0.9139304757, alpha: 1)
        tf.addTarget(self, action: #selector(checkLocation), for: .editingDidEndOnExit)
        return tf
    }()
    
    var mapView: MKMapView = {
        var m = MKMapView()
        m.translatesAutoresizingMaskIntoConstraints = false
        return m
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
    }
    
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        view.backgroundColor = .white
        
        view.addSubview(backView)
        view.addSubview(mapView)
        backView.addSubview(addTF)
        
        addTF.topAnchor.constraint(equalTo: backView.topAnchor, constant: 7).isActive = true
        addTF.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15).isActive = true
        addTF.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15).isActive = true
        addTF.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -7).isActive = true
        
        backView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: mapView.topAnchor).isActive = true
        
        mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: backView.bottomAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
    @objc func checkLocation() {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(addTF.text ?? "", completionHandler: { (placeMark, error) in
            guard let placeMark = placeMark?.first else { return }
            self.destinations.append(placeMark.location!.coordinate)
            self.addAnotation(placeMark.location!.coordinate)
        })
    }
    
    func addAnotation(_ center: CLLocationCoordinate2D) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: center, span: span)
        var p1 = center; p1.latitude += 0.003; p1.longitude -= 0.003
        var p2 = center; p2.latitude += 0.003; p2.longitude += 0.003
        var p3 = center; p3.latitude -= 0.003; p3.longitude += 0.003
        var p4 = center; p4.latitude -= 0.003; p4.longitude -= 0.003
        
        let points: [CLLocationCoordinate2D] = [p1, p2, p3, p4, p1]
        let polyLine = MKPolyline(coordinates: points, count: points.count)
        let destinationLine = MKPolyline(coordinates: self.destinations, count: self.destinations.count)
        
        let annotation: MKPointAnnotation = {
            let a = MKPointAnnotation()
            a.title = "\(mapView.annotations.count+1)번째 행선지"
            a.coordinate = center
            return a
        }()
        mapView.delegate = self
        mapView.addOverlay(polyLine)
        mapView.addOverlay(destinationLine)
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyLine = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyLine)
            renderer.strokeColor = .red
            renderer.lineWidth = 1
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
