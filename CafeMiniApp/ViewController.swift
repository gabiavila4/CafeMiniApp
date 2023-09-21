//
//  ViewController.swift
//  CafeMiniApp
//
//  Created by GABRIELA AVILA on 9/15/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var ItemTFOutlet: UITextField!
    
    @IBOutlet weak var AmtTFOutlet: UITextField!
    
    @IBOutlet weak var cartOutlet: UILabel!
    
    @IBOutlet weak var cartTotOutlet: UILabel!
    
    @IBOutlet weak var errorOutlet: UILabel!
    
    
    var s2: String = "Cart- "
    var i2 = 0
    var menu: [String] = ["banana", "apple", "grape", "avocado", "peach"]
    var prices: [Double] = [1.23, 1.32, 0.75, 4.0, 0.90]
    var s: String = "Menu: \n"
    var total: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // labelOutlet.text = ""
        
        
        
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

    var cart: [String: Int] = [:]
    
    @IBAction func ButtonAction(_ sender: UIButton) {
        
        if (Int(AmtTFOutlet.text!)! >= 1)
        {
        cart[ItemTFOutlet.text!] = Int(AmtTFOutlet.text!)
            
        }else
        {
            errorOutlet.text = "ERROR INVALID INPUT"
        }
        
        s2 = "Cart- "
        for (key, value) in cart{
            
          s2 = "\(s2) \(key) : \(value)\n"
            cartOutlet.text = "\(s2)"
         
            
            i2 = 0
            while i2 < menu.count {
                if (ItemTFOutlet.text == menu[i2])
                {
                total = total + (prices[i2] * Double(AmtTFOutlet.text!)!)
                }//else
                //{
                   // errorOutlet.text = "ERROR ENTER VALID AMOUNT"
                //}
                i2 += 1
            }
            cartTotOutlet.text = "$\(total)"
            
            
        }
    }
   
   
   
    

}

