//
//  CreateNewBrandViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import UIKit

class CreateNewBrandViewController: UIViewController {

    
    @IBOutlet weak var BrandNameTextField: UITextField!
    
    @IBOutlet weak var BrandImgURLTextField: UITextField!
    var CreateNewBrandViewModelObj :CreateNewBrandViewModel?
    var defualtImgURL  = "https://t3.ftcdn.net/jpg/02/93/57/70/360_F_293577016_k8xpaOoaLZxrOmWuVJgdMVvHZWAQtffT.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CreateNewBrandViewModelObj = CreateNewBrandViewModel()
        
    }
    

  

    @IBAction func CreateBrandButton(_ sender: Any) {
        if BrandImgURLTextField.text == ""{
            BrandImgURLTextField.text = "https://t3.ftcdn.net/jpg/02/93/57/70/360_F_293577016_k8xpaOoaLZxrOmWuVJgdMVvHZWAQtffT.jpg"
        }
        CreateNewBrandViewModelObj?.CreateNewBrand(brandNamee: BrandNameTextField.text ?? "New Collction", brandLogoo: BrandImgURLTextField.text!)
        let retrieveBrand = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        self.navigationController?.pushViewController(retrieveBrand, animated: true)
    }
}
