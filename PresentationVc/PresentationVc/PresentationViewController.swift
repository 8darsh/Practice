//
//  PresentationViewController.swift
//  PresentationVc
//
//  Created by Adarsh Singh on 28/08/23.
//

import UIKit

class PresentationViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
   
    @IBOutlet var TypeTxt: UITextField!
    
    
    
    @IBOutlet var TotalPeople: UITextField!
    
    
    @IBOutlet var amount: UITextField!
    
    @IBOutlet var YourAmt: UILabel!
    var amt: Float!
    var ans: Float!
    var modelPresentation = false
    override func viewDidLoad() {
        super.viewDidLoad()

        if modelPresentation{
            self.isModalInPresentation = true
            self.navigationController?.presentationController?.delegate = self
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtn))
        
        
    }
    
    
    
    @objc
    func cancelBtn(){
        self.dismiss(animated: true)
    }
    

    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let ac = UIAlertController(title: "Are u sure?", message: "", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
        ac.addAction(UIAlertAction(title: "Cancel", style: .default){
            (action) in
            self.dismiss(animated: true)
        })
        present(ac,animated: true)
    }
    @IBAction func sPLIT(_ sender: UIButton) {
        amt = Float(amount.text!)
        ans = Float(TotalPeople.text!)
        var ans1 = amt/ans
        YourAmt.text = "Your Amount:  \((ans1))"
    }
    
}


