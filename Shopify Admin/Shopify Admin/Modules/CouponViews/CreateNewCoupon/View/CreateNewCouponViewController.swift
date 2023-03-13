//
//  CreateNewCouponViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 13/03/2023.
//

import UIKit

class CreateNewCouponViewController: UIViewController {
    var CreateNewCouponViewModelObj : CreateNewCouponViewModel?
    var priceRuleID : Int?
    @IBOutlet weak var codeTitleTextField: UITextField!
    
    @IBOutlet weak var discPercentageTextField: UITextField!
    
    
    @IBAction func generatePriceRuleButton(_ sender: Any) {
        
        CreateNewCouponViewModelObj?.bindID = {
            DispatchQueue.main.async {
                self.priceRuleID = self.CreateNewCouponViewModelObj?.priceModelObj.price_rule.id
                self.priceRuleIDLabel.text = String(self.priceRuleID!)

            }
        }
        
        
        
        if codeTitleTextField.text != "" && discPercentageTextField.text != ""{
            DispatchQueue.main.async {
                self.CreateNewCouponViewModelObj?.addPriceRule(discValuee: self.discPercentageTextField.text!, titlee: self.codeTitleTextField.text!)
                
            }
            
    
            CouponNameLabel.text = codeTitleTextField.text
            
            CouponNameLabel.isHidden = false
            priceRuleIDLabel.isHidden = false
            PublishCouponBottunOutLet.isHidden = false
        }
    }
    
    
    @IBOutlet weak var CouponNameLabel: UILabel!
    
    @IBOutlet weak var priceRuleIDLabel: UILabel!
    
    @IBOutlet weak var PublishCouponBottunOutLet: UIButton!
    
    @IBAction func PublishCouponBottun(_ sender: Any) {
        DispatchQueue.main.async {
            self.CreateNewCouponViewModelObj?.addNewCoupon(priceRileID: self.priceRuleID!, codeName: self.codeTitleTextField.text!)
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        CreateNewCouponViewModelObj = CreateNewCouponViewModel()
        
        

    }
    


}
