import UIKit

class Vehicle {
    let name: String
    let maxSpeed: Int
    init(name: String, maxSpeed: Int){
        self.name = name
        self.maxSpeed = maxSpeed
    }
   
}

class Car: Vehicle {
    var modelYear: Int
    var numberOfSeats: Int
    
    init?(modelYear: Int, numberOfSeats: Int, name: String, maxSpeed: Int){
        guard modelYear > 0 || numberOfSeats > 0 else { return nil }
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
        super.init(name: name, maxSpeed: maxSpeed)
    }
}

class Bus: Vehicle {
    let isDoubleDecker: Bool
    init(isDoubleDecker: Bool, name: String, maxSpeed: Int){
        self.isDoubleDecker = isDoubleDecker
        super.init(name: name, maxSpeed: maxSpeed)
    }
    
    convenience init(name: String, isDoubleDecker: Bool) {
        self.init(isDoubleDecker: isDoubleDecker, name: name, maxSpeed: 100)
    }
}
