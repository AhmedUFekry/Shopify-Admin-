//
//  AdminCrudOperaionsViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 07/03/2023.
//

import UIKit

class AdminCrudOperaionsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//Customer Buttons *********************
    @IBAction func CreateCusomerButton(_ sender: Any) {
        let CreateNewUserVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        self.navigationController?.pushViewController(CreateNewUserVC, animated: true)
    }
    
    @IBAction func RetrieveCusomerButton(_ sender: Any) {
    }
    
    @IBAction func UpdateCusomerButton(_ sender: Any) {
    }
    
    @IBAction func DeleteCusomerButton(_ sender: Any) {
    }
    //**********************************
    
    
    //Products Buttons******************
    
    @IBAction func CreateProductButton(_ sender: Any) {
    }
    
    @IBAction func RetrieveProductButton(_ sender: Any) {
        let getProucts = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        
        self.navigationController?.pushViewController(getProucts, animated: true)
    }
    
    @IBAction func UpdateProductButton(_ sender: Any) {
    }
    
    @IBAction func DeleteProductButton(_ sender: Any) {
    }
    //**********************************
    
    
    //Inventory Buttons******************
    
    @IBAction func CreateInventoryButton(_ sender: Any) {
    }
    
    @IBAction func RetrieveInventoryButton(_ sender: Any) {
    }
    
    @IBAction func UpdateInventoryButton(_ sender: Any) {
    }
    
    @IBAction func DeleteInventoryButton(_ sender: Any) {
    }
    //***********************************
    
    //Coupons Buttons******************
    
    @IBAction func CreateCouponsButton(_ sender: Any) {
    }
    
    @IBAction func RetrieveCouponsButton(_ sender: Any) {
    }
    
    @IBAction func UpdateCouponsButton(_ sender: Any) {
    }
    
    @IBAction func DeleteCouponsButton(_ sender: Any) {
    }
    //*********************************
    
    
    
    
}
