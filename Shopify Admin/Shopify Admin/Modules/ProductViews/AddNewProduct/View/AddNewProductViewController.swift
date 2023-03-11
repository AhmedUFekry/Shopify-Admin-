//
//  AddNewProductViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import UIKit

class AddNewProductViewController: UIViewController {

    
    @IBOutlet weak var productTitleTextField: UITextField!
    
    @IBOutlet weak var productDiscTextView: UITextView!
    
    @IBOutlet weak var ProductVendorTextField: UITextField!
    
    @IBOutlet weak var ProductTypeTextField: UITextField!
    
    @IBOutlet weak var ProductPriceTextField: UITextField!
    
    
    @IBOutlet weak var ProductStatusSwitchButton: UISwitch!
    
    @IBOutlet weak var PublishProductSwitchButton: UISwitch!
    
    var addProductViewModel : AddProductViewModel?
    var productStatus : String?
    var publishProduct : Bool?
    var ProductPrice: Int?
    @IBAction func ProductStatusSwitch(_ sender: UISwitch) {
        if ProductStatusSwitchButton.isOn{
            productStatus = "active"
        }else{
            productStatus = "draft"
        }
        
    }
    
    
    
    
    
    
    
    @IBAction func PublishProductSwitch(_ sender: UISwitch) {
        if PublishProductSwitchButton.isOn{
            publishProduct = true
        }else{
            publishProduct = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func CreatProductButton(_ sender: Any) {
        
        addProductViewModel = AddProductViewModel()
        ProductPrice = Int(ProductPriceTextField.text ?? "0")
        
        
        addProductViewModel?.addProduct(product_title: productTitleTextField.text ?? "Product Title", product_discription: productDiscTextView.text, product_vendor: ProductVendorTextField.text ?? "Product Vendor", product_type: ProductTypeTextField.text ?? "Product Type", status: productStatus ?? "active", publish: publishProduct ?? true, product_price: ProductPrice ?? 0)
        print("Product Created")
        
        let getProucts = self.storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        
        self.navigationController?.pushViewController(getProucts, animated: true)
        
    }
    


}
