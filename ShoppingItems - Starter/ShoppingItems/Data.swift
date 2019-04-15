//
//  Data.swift
//  ShoppingItems
//
//  Created by hyeoktae kwon on 15/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

var saleArray = [SEG(), SER(), Eight(), XG(), XW(), XSG(), XSW(), A1(), A2(), XRW(), XRB(), XRBL(), XRY(), XRC(), XRR(), P11S(), P11G(), P13S(), P13G()]

enum SaleProduct {
    case seg(SEG), ser(SER), eight(Eight), xg(XG)
    case xw(XW), xsg(XSG), xsw(XSW), a1(A1), a2(A2)
    case xrw(XRW), xrb(XRB), xrbl(XRBL), xry(XRY), xrc(XRC), xrr(XRR)
    case p11s(P11S), p11g(P11G), p13s(P13S), p13g(P13G)
}

class APPLE {
    var image = UIImage()
    var name: String
    var stock: Int
    var count: Int
    init() {
        image = UIImage()
        name = ""
        stock = 0
        count = 0
    }
}

class SEG: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "iPhone8")
        super.name = "iPhone SE (Gold)"
        super.stock = 5
    }
}

class SER: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "iPhoneSE_RoseGold")
        super.name = "iPhone SE (RoseGold)"
        super.stock = 7
    }
}

class Eight: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "iPhoneSE_Gold")
        super.name = "iPhone 8"
        super.stock = 3
    }
}

class XG: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "iPhoneX_SpaceGray")
        super.name = "iPhone X (Space Gray)"
        super.stock = 10
    }
}

class XW: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "iPhoneX_White")
        super.name = "iPhone X (White)"
        super.stock = 12
    }
}

class XSG: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "iPhoneX_SpaceGray")
        super.name = "iPhone XS (Space Gray)"
        super.stock = 9
    }
}

class XSW: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "iPhoneX_White")
        super.name = "iPhone XS (White)"
        super.stock = 2
    }
}

class A1: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "airpot1")
        super.name = "AirPot 1"
        super.stock = 11
    }
}

class A2: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "airpot2")
        super.name = "AirPot 2"
        super.stock = 0
    }
}

class XRW: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "XR White")
        super.name = "iPhone XR (White)"
        super.stock = 9
    }
}

class XRB: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "XR Black")
        super.name = "iPhone XR (Black)"
        super.stock = 8
    }
}

class XRBL: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "XR Blue")
        super.name = "iPhone XR (Blue)"
        super.stock = 8
    }
}

class XRY: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "XR Yellow")
        super.name = "iPhone XR (Yellow)"
        super.stock = 7
    }
}

class XRC: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "XR Coral")
        super.name = "iPhone XR (Coral)"
        super.stock = 6
    }
}

class XRR: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "XR Red")
        super.name = "iPhone XR (Red)"
        super.stock = 5
    }
}

class P11S: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "Pad 11 Silver")
        super.name = "iPad 11 (Silver)"
        super.stock = 11
    }
}

class P11G: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "Pad 11 Gray")
        super.name = "iPad 11 (Space Gray)"
        super.stock = 10
    }
}

class P13S: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "Pad 12.9 Silver")
        super.name = "iPad 12.9 (Silver)"
        super.stock = 12
    }
}

class P13G: APPLE {
    override init() {
        super.init()
        super.image = #imageLiteral(resourceName: "Pad 12.9 Gray")
        super.name = "iPad 12.9 (Space Gray)"
        super.stock = 17
    }
}
