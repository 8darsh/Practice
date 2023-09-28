//
//  ViewController.swift
//  PresentationVc
//
//  Created by Adarsh Singh on 28/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPayment))
    }
    @objc
    func addPayment(){
//        
        let pVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentVc") as! PresentationViewController
        pVC.modelPresentation = true
        pVC.modalPresentationStyle = .formSheet
        let navVC = UINavigationController(rootViewController: pVC)
        self.present(navVC, animated: true, completion: nil)
    }


}

