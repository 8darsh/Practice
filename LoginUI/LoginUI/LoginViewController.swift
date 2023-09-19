//
//  LoginViewController.swift
//  LoginUI
//
//  Created by Adarsh Singh on 17/09/23.
//

import UIKit

class LoginViewController: UITableViewController {
    
    @IBOutlet var emailTxt: UITextField!
    
    @IBOutlet var passwordTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    
    fileprivate func ValidateFields() {
        if let email = emailTxt.text, let password = passwordTxt.text{
            
            if !email.validateEmailId(){
                
                openAlert(title: "Mail Id", message: "Enter Valid Mail", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
                    print("Okay Clicked")
                    
                }])
            }
            else if !password.validatePassword(){
                openAlert(title: "Password", message: "Enter Valid Password", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.cancel], actions: [{ _ in
                    print("Okay Clicked")
                    
                }])
                
            }
        }else{
            openAlert(title: "Alert", message: "Add Details", alertStyle: .alert, actionTitles: ["Ok"], actionStyles: [.default], actions: [{ _ in
                print("Okay Clicked")
                
            }])
        }
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        ValidateFields()
    }
    

}
extension LoginViewController{
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return UIScreen.main.bounds.height
    //    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let centeringInset = (tableViewHeight - contentHeight) / 2.0
        
        let topInset = max(centeringInset, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
}
