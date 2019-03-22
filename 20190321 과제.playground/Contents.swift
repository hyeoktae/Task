import UIKit

class Animal {
    let brain = true
    var legs = 0
}

class Human: Animal {
    override var legs: Int {
        get{
            return super.legs
        }
        set{
            super.legs = 2
        }
    }
}

class Pet: Animal {
    var fleas = 0
    override var legs: Int {
        get{
            return super.legs
        }
        set{
            super.legs = 4
        }
    }
}

class Dog: Pet {
    override var fleas: Int {
        get{
            return super.fleas
        }
        set{
            super.fleas = 8
        }
    }
}

class Cat: Pet {
    override var fleas: Int {
        get{
            return super.fleas
        }
        set{
            super.fleas = 4
        }
    }
}


//-----------------------------

class Square {
    var s: Int
    
    init(_ s: Int){
        self.s = s
    }
    
    func A() -> Int{
        return self.s * self.s
    }
    func P() -> Int{
        return 4 * self.s
    }
}

class Rectangle {
    var w: Int
    var l: Int
    
    init(w: Int, _ l: Int){
        self.w = w
        self.l = l
    }
    
    func A() -> Int{
        return self.w * self.l
    }
    func P() -> Int{
        return 2 * (self.l + self.w)
    }
}

class Circle {
    var r: Double
    
    init(_ r: Double){
        self.r = r
    }
    
    func A() -> Double{
        return  Double.pi * self.r * self.r
    }
    func C() -> Double{
        return 2 * self.r * Double.pi
    }
}

class Triangle {
    var b: Int
    var h: Int
    
    init(b: Int, _ h: Int){
        self.b = b
        self.h = h
    }
    
    func A() -> Int{
        return self.b * self.h / 2
    }
}

class Trapezoid {
    var b: Int
    var h: Int
    var a: Int
    
    init(b: Int, h: Int, _ a: Int){
        self.b = b
        self.h = h
        self.a = a
    }
    
    func A() -> Int{
        return (self.b + self.a) * self.h / 2
    }
}

// ------------------

class Cube: Square {
    
    func V() -> Double{
        return pow(Double(self.s), 3)
    }
}

class RectangularSolid: Rectangle {
    var h: Int
    
    init(h: Int, w: Int, l: Int) {
        self.h = h
        super.init(w: w, l)
    }
    
    func V() -> Int{
        return self.l * self.w * self.h
    }
}

class CircularCylinder: Circle {
    var h: Double
    
    init(r: Double, h: Double) {
        self.h = h
        super.init(r)
    }
    
    func V() -> Double{
        return self.h * Double.pi * self.r * self.r
    }
}

class Sphere: Circle {
    func V() -> Double {
        return pow(self.r, 3) * Double.pi * 4 / 3
    }
    
    
}

class Cone: Triangle {
    func V() -> Double{
        let r:Double = Double(self.b) / 2
        return r * r * Double(self.h) * Double.pi * 1/3
    }
}
