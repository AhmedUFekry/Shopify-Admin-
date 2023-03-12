//
//  DeletBrandViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 12/03/2023.
//

import UIKit

class DeletBrandViewController: UIViewController {
    var brandID : Int?
    var brandTitle : String?
   var DeleteBrandViewModelObj : DeleteBrandViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        DeleteBrandViewModelObj = DeleteBrandViewModel()
        
        
    }
    
    
    
    @IBAction func DeleteBrandButton(_ sender: Any) {
        var alert = UIAlertController(title: "Delete", message: "Delete Brand ID:\(self.brandID ?? 0) from App Brands", preferredStyle: .actionSheet)

        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            
            self.DeleteBrandViewModelObj?.deletBrand(brandID: self.brandID!)
                self.navigationController?.popViewController(animated: true)
             
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)

        // Add the actions
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)

        // Present the controller
        self.present(alert, animated: true)
    }
    
    
    
}

