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
        let getCustomers = self.storyboard?.instantiateViewController(withIdentifier: "RetrieveCustomersViewController") as! RetrieveCustomersViewController
        
        self.navigationController?.pushViewController(getCustomers, animated: true)
    }
    
   
    //**********************************
    
    
    //Products Buttons******************
    
    @IBAction func CreateProductButton(_ sender: Any) {
        let CreateProucts = self.storyboard?.instantiateViewController(withIdentifier: "AddNewProductViewController") as! AddNewProductViewController
        
        self.navigationController?.pushViewController(CreateProucts, animated: true)
    }
    
    @IBAction func RetrieveProductButton(_ sender: Any) {
        let getProucts = self.storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        
        self.navigationController?.pushViewController(getProucts, animated: true)
    }
    
    @IBAction func UpdateProductButton(_ sender: Any) {
    }
    
    
    //**********************************
    
    
    //Inventory Buttons******************
    
    @IBAction func CreateInventoryButton(_ sender: Any) {
        let CreateBrand = self.storyboard?.instantiateViewController(withIdentifier: "CreateNewBrandViewController") as! CreateNewBrandViewController
        
        self.navigationController?.pushViewController(CreateBrand, animated: true)
        
    }
    
    @IBAction func RetrieveInventoryButton(_ sender: Any) {
        let retrieveBrand = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        self.navigationController?.pushViewController(retrieveBrand, animated: true)
        
    }
    
  
    //***********************************
    
    //Coupons Buttons******************
    
    @IBAction func CreateCouponsButton(_ sender: Any) {
        let createCop = self.storyboard?.instantiateViewController(withIdentifier: "CreateNewCouponViewController") as! CreateNewCouponViewController
        
        self.navigationController?.pushViewController(createCop, animated: true)
    }
    
    @IBAction func RetrieveCouponsButton(_ sender: Any) {
        let retrieveCop = self.storyboard?.instantiateViewController(withIdentifier: "CopounsViewController") as! CopounsViewController
        
        self.navigationController?.pushViewController(retrieveCop, animated: true)
        
    }
    
    
    
    //*********************************
    
    
    
    
}
