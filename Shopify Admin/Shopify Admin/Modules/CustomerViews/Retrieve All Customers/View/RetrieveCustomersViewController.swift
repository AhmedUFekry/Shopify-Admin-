//
//  RetrieveCustomersViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 08/03/2023.
//

import UIKit

class RetrieveCustomersViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    
    var retrieveCusomersViewModel : RetrieveCustomersViewModel?
    var customerList : AllCustomers?
    var customerIDstring : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveCusomersViewModel = RetrieveCustomersViewModel()
       /* DispatchQueue.main.async { [self] in
            retrieveCusomersViewModel?.deleteCustomer(customerID: 6846245732651)
        }*/
  
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        retrieveCusomersViewModel?.bindingCustomers = { [weak self] in
            DispatchQueue.main.async {
                self?.customerList = self?.retrieveCusomersViewModel?.AllCustomersResponse
                self?.tableView.reloadData()
            }
            
        }
        retrieveCusomersViewModel?.getAllCustomer()
    }
    
    
    

}



// Customers TableView Extention
extension RetrieveCustomersViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerList?.customers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "RetrieveCustomersTableViewCell") as! RetrieveCustomersTableViewCell?
         var deletedID = customerList?.customers[indexPath.row].id
        cell?.CustomerIDLabel.text =  String (deletedID ?? 0)
        cell?.CustomerEmailLabel.text = customerList?.customers[indexPath.row].email
        cell?.CustomerNameLabel.text = customerList?.customers[indexPath.row].first_name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            
                retrieveCusomersViewModel?.deleteCustomer(customerID: (customerList?.customers[indexPath.row].id)!)
                customerList?.customers.remove(at: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            //self.tableView.reloadData()
        }
    }
    
    
}
