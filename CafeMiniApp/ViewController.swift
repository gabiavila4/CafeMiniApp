//
//  ViewController.swift
//  CafeMiniApp
//
//  Created by GABRIELA AVILA on 9/15/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var ItemTFOutlet: UITextField!
    
    @IBOutlet weak var AmtTFOutlet: UITextField!
    
    @IBOutlet weak var cartOutlet: UILabel!
    
    @IBOutlet weak var cartTotOutlet: UILabel!
    
    @IBOutlet weak var errorOutlet: UILabel!
    
    @IBOutlet weak var errorItemOutlet: UILabel!
    
    @IBOutlet weak var errorMultiOutlet: UILabel!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var newItemOutlet: UITextField!
    
    @IBOutlet weak var newPriceOutlet: UITextField!
    
    @IBOutlet weak var adminLabelOutlet: UILabel!
    
    @IBOutlet weak var indexOutlet: UITextField!
    
    var go: Bool = false
    var s2: String = "Cart- "
    var i2 = 0
    var i3 = 0
    var menu: [String] = ["banana", "apple", "grape", "avocado", "peach"]
    var prices: [Double] = [1.23, 1.32, 0.75, 4.0, 0.90]
    var s: String = "Menu: \n"
    var total: Double = 0.0
    var totBefore: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        passwordOutlet.resignFirstResponder()
        newItemOutlet.resignFirstResponder()
        newPriceOutlet.resignFirstResponder()
        
        var i = 0
        labelOutlet.text = "hi"
        while i < prices.count {

        s = "\(s) \(menu[i])- $\(prices[i]) \n"
            i = i + 1
        }
        labelOutlet.text = s
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        return true
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    var cart: [String: Int] = [:]
    
    @IBAction func ButtonAction(_ sender: UIButton) {
        
        if menu.contains(ItemTFOutlet.text!.lowercased())
        {
            let check = cart.contains{ (key, value) in
                return key == ItemTFOutlet.text?.lowercased()
            }
            if check {
                errorMultiOutlet.text = "you already added this item"
            }else
            {
                if errorItemOutlet.text == "" && Int(AmtTFOutlet.text!)! >= 1
                {
                    cart[ItemTFOutlet.text!] = Int(AmtTFOutlet.text!)
                    
                }else if (Int(AmtTFOutlet.text!)! < 1)
                {
                    errorOutlet.text = "ERROR INVALID INPUT"
                }
            }
        }
        
        if AmtTFOutlet.text == ""
        {
            errorOutlet.text = "ERROR INVALID INPUT"
        }else
        {
        
        let amount = Int(AmtTFOutlet.text!) ?? 0
        if (amount != 0)
            {
            
            //attempt
            totBefore = 0
            i2 = 0
            errorItemOutlet.text = ""
            
            while i2 < menu.count {
                if (ItemTFOutlet.text == menu[i2])
                {
                    total = total + (prices[i2] * Double(AmtTFOutlet.text!)!)
                    totBefore = total
                }else if totBefore == 0
                {
                    errorItemOutlet.text = "ERROR ENTER VALID ITEM"
                }
                i2 += 1
            }
            cartTotOutlet.text = "$\(total)"
            
            
            //  if (Int(AmtTFOutlet.text!)! >= 1)
           
            
            s2 = "Cart- "
            for (key, value) in cart{
                
                s2 = "\(s2) \(key) : \(value)\n"
                cartOutlet.text = "\(s2)"
                
            }
        }else
            {
            errorOutlet.text = "ERROR INVALID INPUT"
        }
            
        }
    }
   
   
   
    @IBAction func adminAction(_ sender: UIButton) {
        
        if (passwordOutlet.text?.lowercased() == "cookie")
        {
            go = true
            adminLabelOutlet.text = "Correct!"
            
        }else
        {
            go = false
            adminLabelOutlet.text = "Incorrect Password"
        }
        
        
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        
        if go == true{
            menu.append(newItemOutlet.text!)
            prices.append(Double( newPriceOutlet.text!)!)
            
            s = ""
            labelOutlet.text = "hi"
            while i3 < prices.count {

            s = "\(s) \(menu[i3])- $\(prices[i3]) \n"
                i3 = i3 + 1
            }
            labelOutlet.text = s
           
            }
            
            
        }
    
    
    @IBAction func deleteAction(_ sender: UIButton) {
        menu[Int(indexOutlet.text!)!] = ""
        prices[Int(indexOutlet.text!)!] = 0
        s = ""
        labelOutlet.text = "hi"
        while i3 < prices.count {

        s = "\(s) \(menu[i3])- $\(prices[i3]) \n"
            i3 = i3 + 1
        }
        labelOutlet.text = s
    }
    
    
    
    
    
    
    

}

