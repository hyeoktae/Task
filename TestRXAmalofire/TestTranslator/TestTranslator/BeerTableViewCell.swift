//
//  BeerTableViewCell.swift
//  TestTranslator
//
//  Created by hyeoktae kwon on 24/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var beerCard: UIButton!
    var isOpen = false
    var beerInfoView = UIView()
    var beerName = UILabel()
    var beerImage: UIImage? = UIImage()
    let url = URL(string: "https://api.punkapi.com/v2/beers/159.png")!
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func dounloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.beerCard.setImage(UIImage(data: data), for: .normal)
                print("dd", UIImage(data: data))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        dounloadImage(from: url)
        // Initialization code
    }
    
    func makeBeerInfoView() {
        beerInfoView.frame = beerCard.frame
        beerName.frame = CGRect(x: 0, y: 0, width: beerInfoView.frame.width, height: beerInfoView.frame.height)
        beerName.textAlignment = .center
        beerInfoView.addSubview(beerName)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func beerFlip(_ sender: UIButton) {
        makeBeerInfoView()
        if isOpen{
            isOpen = false
            beerCard.backgroundColor = .green
            beerInfoView.removeFromSuperview()
                beerCard.setImage(beerImage, for: .normal)
                print("imageRun")
            
            beerCard.setImage(beerImage, for: .normal)
            UIView.transition(with: beerCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }else {
            isOpen = true
            beerImage = nil
//            beerCard.setImage(beerImage, for: .normal)
            beerCard.backgroundColor = .red
            beerCard.addSubview(beerInfoView)
            beerInfoView.backgroundColor = .red
            beerCard.backgroundColor = .clear
            UIView.transition(with: beerInfoView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
    
    
}
