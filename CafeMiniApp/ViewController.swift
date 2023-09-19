//
//  ViewController.swift
//  CafeMiniApp
//
//  Created by GABRIELA AVILA on 9/15/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    
    
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // labelOutlet.text = ""
        
        var menu: [String] = ["banana", "apple", "grape", "avocado", "peach"]
        var prices: [Double] = [1.23, 1.32, 0.75, 4.0, 0.90]
        var s: String = ""
//        for bslh in menu
//        {
//            print(" \(bslh)")
//            labelOutlet.text = labelOutlet.text! + " \(bslh), "
//        }
        var i = 0
        labelOutlet.text = "hi"
        while i < prices.count {

        s = "\(s) \(menu[i])- $\(prices[i]) \n"
            i = i + 1
        }
        labelOutlet.text = s
    }

    
    
   
   
   
    

}

