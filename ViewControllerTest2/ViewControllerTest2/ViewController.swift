//
//  ViewController.swift
//  ViewControllerTest2
//
//  Created by hyeoktae kwon on 27/03/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var viewForCoke: UIView = UIView()
    var viewForJuicy: UIView = UIView()
    var viewForLipton: UIView = UIView()
    var viewForPepsi: UIView = UIView()
    
    var buttonForCoke: UIButton = UIButton()
    var buttonForJuicy: UIButton = UIButton()
    var buttonForLipton: UIButton = UIButton()
    var buttonForPepsi: UIButton = UIButton()
    
    var labelForCoke: UILabel = UILabel()
    var labelForJuicy: UILabel = UILabel()
    var labelForLipton: UILabel = UILabel()
    var labelForPepsi: UILabel = UILabel()
    
    var priceLabelForCoke: UILabel = UILabel()
    var priceLabelForJuicy: UILabel = UILabel()
    var priceLabelForLipton: UILabel = UILabel()
    var priceLabelForPepsi: UILabel = UILabel()
    
    
    var imageForCoke: UIImageView = UIImageView()
    var imageForJuicy: UIImageView = UIImageView()
    var imageForLipton: UIImageView = UIImageView()
    var imageForPepsi: UIImageView = UIImageView()
    
    var labelForTotalPrice: UILabel = UILabel()
    
    var totalMoney: Int = 0
    
    var padding: CGFloat = 20
    
    var beverageView: BeverageView = BeverageView()
    
    func coke(){
        viewForCoke.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        viewForCoke.frame = CGRect(x: padding, y: padding*3, width: view.frame.width/2-padding*2, height: view.frame.height/3-padding*3)
        viewForCoke.layer.cornerRadius = 10
        
        self.view.addSubview(viewForCoke)
        
        buttonForCoke.frame = CGRect(x: padding, y: viewForCoke.frame.height-padding*3, width: viewForCoke.frame.width - padding*2, height: padding*2)
        buttonForCoke.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        buttonForCoke.setTitle("구입하기", for: .normal)
        buttonForCoke.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        buttonForCoke.tag = 1
        viewForCoke.addSubview(buttonForCoke)
        buttonForCoke.addTarget(self, action: #selector(addMoney(_:)), for: .touchUpInside)
        
        priceLabelForCoke.frame = CGRect(x: viewForCoke.frame.width - padding*6, y: viewForCoke.frame.height - buttonForCoke.frame.height - padding*3, width: viewForCoke.frame.width - padding*6, height: padding*2)
        priceLabelForCoke.text = "1500"
        priceLabelForCoke.textAlignment = .center
        viewForCoke.addSubview(priceLabelForCoke)
        
        labelForCoke.frame = CGRect(x: viewForCoke.frame.width - padding * 6, y: viewForCoke.frame.height - buttonForCoke.frame.height - priceLabelForCoke.frame.height - padding*3, width: viewForCoke.frame.width - padding*3, height: padding*2)
        labelForCoke.text = "코카콜라"
        labelForCoke.textAlignment = .center
        viewForCoke.addSubview(labelForCoke)
        
        imageForCoke.frame = CGRect(x: 10, y: 10, width: viewForCoke.frame.width - padding*2, height: viewForCoke.frame.height - buttonForCoke.frame.height - priceLabelForCoke.frame.height - labelForCoke.frame.height - padding*2)
//        imageForCoke.backgroundColor = .gray
        viewForCoke.addSubview(imageForCoke)
        
        imageForCoke.image = #imageLiteral(resourceName: "coke")
        
        beverageView.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        self.view.addSubview(beverageView)
    }
    
    func totalPriceLabel(){
        labelForTotalPrice.frame = CGRect(x: padding, y: view.frame.height - viewForCoke.frame.height*2, width: view.frame.width - padding, height: padding*3)
        
        labelForTotalPrice.textAlignment = .right
        labelForTotalPrice.font = UIFont.boldSystemFont(ofSize: 40)
        labelForTotalPrice.text = String(totalMoney)
        view.addSubview(labelForTotalPrice)
    }
    
    @objc func addMoney(_ sender: UIButton){
        if sender.tag == 1{
            totalMoney += 1500
            self.labelForTotalPrice.text = String(totalMoney)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        coke()
        totalPriceLabel()
    }


}

