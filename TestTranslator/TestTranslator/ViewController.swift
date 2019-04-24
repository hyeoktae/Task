//
//  ViewController.swift
//  TestTranslator
//
//  Created by hyeoktae kwon on 23/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        makeTableView()
        tableView.dataSource = self
        repeat {
            tableView.reloadData()
        }while (Beer.shared.beer.count < 25)
    }
    
   
    
    
    
    func makeTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.register(UINib(nibName: "BeerTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
    }

    func getInfo() {
        HttpClientApi.instance().makeAPICall(url: "https://api.punkapi.com/v2/beers", params:paramsDictionary, method: .GET, success: { (data, response, error) in
            
            // API call is Successfull
            do {
                let beer = try JSONDecoder().decode([BeerData].self, from: data)
                Beer.shared.beer = beer
                print("ok")
                print(beer.count)
                print(Beer.shared.beer.count)
            }catch(let error){
                print(error.localizedDescription)
            }
        }, failure: { (data, response, error) in
            
            // API call Failure
            print("fail")
            
        })
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Beer.shared.beer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BeerTableViewCell
        cell.beerName.text = Beer.shared.beer[indexPath.row].name
        
        
        print("run")
        return cell
    }
    
    
}

