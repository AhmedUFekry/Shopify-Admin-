//
//  LoginViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 07/03/2023.
//

import UIKit

class LoginViewController: UIViewController {
    var loginCustomer:loginViewModel?
    var loginStatus:Int = 0
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginCustomer = loginViewModel()
        
        
        
        
        textFieldBorder(textField: username)
        textFieldBorder(textField: password)
        
        
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        
        
        loginCustomer?.bindingLogin = { [weak self] in
            DispatchQueue.main.async {
                
                if self?.loginCustomer?.AuthCustomer(customerEmail: self?.username.text ?? "", customerPasssword: self?.password.text ?? "") == 1 {
                    
                    let AdminCrudOp = self?.storyboard?.instantiateViewController(withIdentifier: "AdminCrudOperaionsViewController") as! AdminCrudOperaionsViewController
    
                    self?.navigationController?.pushViewController(AdminCrudOp, animated: true)
                    self?.errorLabel.text = "Login Successful"
                    
                }
                else{
                    
                    self?.errorLabel.text = "Uncorrect Password"
                }
                
            }
        }
        
              
        loginCustomer?.getCustomer()

    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
       // let signUp = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")as! SignUpViewController
       // navigationController?.pushViewController(signUp, animated: true)
    }
    
    
}
func textFieldBorder(textField:UITextField){
    textField.layer.cornerRadius = 15.0
    textField.layer.borderWidth = 2.0
    textField.layer.borderColor = UIColor.orange.cgColor
}
