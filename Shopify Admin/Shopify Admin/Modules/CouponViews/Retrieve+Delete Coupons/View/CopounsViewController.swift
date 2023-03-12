//
//  CopounsViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 13/03/2023.
//

import UIKit

class CopounsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var couponsList : AllpriceModel?
    var couponsViewModelObj : CopounsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        couponsViewModelObj = CopounsViewModel()
        couponsViewModelObj?.bindingCopouns = { [weak self] in
            DispatchQueue.main.async {
                self!.couponsList = self!.couponsViewModelObj?.AllCouponsResponse
                self?.tableView.reloadData()
            }
            
        }
        
        couponsViewModelObj?.getAllCopouns()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

 
extension CopounsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return couponsList?.price_rules?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CopounsTableViewCell") as! CopounsTableViewCell?
        var id : String = String(((couponsList?.price_rules?[indexPath.row].id ?? 0)))
        cell?.IDLabel.text = id
        cell?.NameLabel.text = couponsList?.price_rules?[indexPath.row].title
        
        return cell!
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var alert = UIAlertController(title: "Delete", message: "Delete \(self.couponsList?.price_rules?[indexPath.row].title ?? "title") from App Coupons", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            if editingStyle == UITableViewCell.EditingStyle.delete {
                
                
                self.couponsViewModelObj?.deleteCoupon(priceRuleID:(self.couponsList?.price_rules?[indexPath.row].id)!)
                self.couponsList?.price_rules?.remove(at: indexPath.row)
                
                
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                //self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        
        // Add the actions
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        // Present the controller
        self.present(alert, animated: true)
    }
    
    
    
    
    
}
