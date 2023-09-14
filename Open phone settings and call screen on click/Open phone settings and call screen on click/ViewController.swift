//
//  ViewController.swift
//  Open phone settings and call screen on click
//
//  Created by Adarsh Singh on 13/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let application = UIApplication.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func settingBtn(_ sender: UIButton) {
        if let settingUrl = URL(string: UIApplication.openSettingsURLString){
            application.open(settingUrl)
        }
    }
    
    @IBAction func callBtn(_ sender: UIButton) {
        if let phoneUrl = URL(string: "tel://8368179865"){
            if application.canOpenURL(phoneUrl){
                application.open(phoneUrl)
            }else{
                //alert
            }
        }
    }
    
}

