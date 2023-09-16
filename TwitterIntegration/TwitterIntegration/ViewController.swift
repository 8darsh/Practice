//
//  ViewController.swift
//  TwitterIntegration
//
//  Created by Adarsh Singh on 13/09/23.
//
// HhEC8uW0DNVk1aQgjK8xQjUUQ
// 0wenKom5RE53FgChNABVpyZ6h6rHIDcoQUdWSJwrOm5YTsGgqR
import UIKit

class ViewController: UIViewController {
    @IBOutlet var login: UIButton!
    
    @IBOutlet var logout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        FHSTwitterEngine.shared().permanentlySetConsumerKey("HhEC8uW0DNVk1aQgjK8xQjUUQ", andSecret: "0wenKom5RE53FgChNABVpyZ6h6rHIDcoQUdWSJwrOm5YTsGgqR")
    }
    @IBAction func loginBtn(_ sender: UIButton) {

        
        let loginB = FHSTwitterEngine.shared().loginController { success in
            self.login.isHidden = true
            self.logout.isHidden = false
        } as UIViewController
        
        self.present(loginB, animated: true)
    }
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        
        FHSTwitterEngine.shared().clearAccessToken()
        self.login.isHidden = false
        self.logout.isHidden = true

    }
    
    

}

