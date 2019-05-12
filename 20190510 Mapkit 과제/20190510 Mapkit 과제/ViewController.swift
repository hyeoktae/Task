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
    
    
    
    
    @objc func checkLocation() {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(addTF.text ?? "", completionHandler: { (placeMark, error) in
            guard let placeMark = placeMark?.first else { return }
            self.destinations.append(placeMark.location!.coordinate)
//            self.addAnnotation(placeMark.location?.coordinate) // 기본과제
            self.mapView.removeOverlays(self.mapView.overlays)
            self.mapView.removeAnnotations(self.mapView.annotations)
            self.addAnnotations(self.destinations)
        })
    }
    
    func addAnnotations(_ center: [CLLocationCoordinate2D]) {
        guard !center.isEmpty else { return }
        
        mapView.delegate = self
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: center.last!, span: span)
        let destinationLine = MKPolyline(coordinates: self.destinations, count: self.destinations.count)
        
        for (idx, value) in destinations.enumerated() {
            let annotation: MKPointAnnotation = {
                let a = MKPointAnnotation()
                a.title = "\(idx+1)번째 행선지"
                a.coordinate = value
                return a
            }()
            
            var p1 = value; p1.latitude += 0.003; p1.longitude -= 0.003
            var p2 = value; p2.latitude += 0.003; p2.longitude += 0.003
            var p3 = value; p3.latitude -= 0.003; p3.longitude += 0.003
            var p4 = value; p4.latitude -= 0.003; p4.longitude -= 0.003
            
            let points: [CLLocationCoordinate2D] = [p1, p2, p3, p4, p1]
            let polyLine = MKPolyline(coordinates: points, count: points.count)
            
            mapView.addAnnotation(annotation)
            mapView.addOverlay(polyLine)
        }
        
        mapView.addOverlay(destinationLine)
        mapView.setRegion(region, animated: true)
    }
    
    func addAnnotation(_ center: CLLocationCoordinate2D) {
        
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
            a.subtitle = "\(mapView.annotations.count+1)"
            a.coordinate = center
            return a
        }()
        
        mapView.delegate = self
        mapView.addOverlay(polyLine)
        mapView.addOverlay(destinationLine)
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
    
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.red
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKAnnotationView
        
        if let reusableView = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation") {
            reusableView.annotation = annotation
            annotationView = reusableView
        } else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
            annotationView.canShowCallout = true
            
        annotationView.image = textToImage(drawText: "@", inImage: UIImage(named: "empty")!, atPoint: CGPoint(x: 0, y: 0))

            let addButton: UIButton = {
                let addButton = UIButton(type: .custom)
                addButton.tag = 0
                addButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
                addButton.setTitle("X", for: .normal)
                addButton.setTitleColor(.red, for: .normal)
                addButton.layer.borderWidth = 1
                addButton.layer.borderColor = UIColor.red.cgColor
                addButton.layer.cornerRadius = 10
                addButton.titleLabel?.font = addButton.titleLabel?.font.withSize(16)
                addButton.addTarget(self, action: #selector(deleteAnnotation), for: .touchUpInside)
                return addButton
            }()
            
            annotationView.rightCalloutAccessoryView = addButton
        }
        return annotationView
    }
    
    @objc func deleteAnnotation() {
        let idx = Int(mapView.selectedAnnotations[0].title!!.dropLast("번째 행선지".count))
        
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeAnnotations(mapView.selectedAnnotations)
        destinations.remove(at: idx! - 1)
        addAnnotations(destinations)
        
    }
    
}
