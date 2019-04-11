//
//  ViewController.swift
//  20190411 과제2
//
//  Created by hyeoktae kwon on 11/04/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var pageC: UIPageControl?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView?.delegate = self
        
    }

    func controlPage(_ x:Int) {
        pageC?.currentPage = x
    }

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let viewX = scrollView.contentOffset.x
        let currentX = view.frame.maxX*4
        
        switch viewX {
        case 0:
            controlPage(0)
        case currentX*0.25:
            controlPage(1)
        case currentX*0.5:
            controlPage(2)
        case currentX*0.75:
            controlPage(3)
        default:
            break
        }
    }
}
