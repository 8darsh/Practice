//
//  ViewController.swift
//  FloatingActionBtn
//
//  Created by Adarsh Singh on 10/09/23.
//

import UIKit

class ViewController: UIViewController {

    
    var actionButton: ActionButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupBtns(){
        
        let google = ActionButtonItem(title: "Google", image: UIImage(imageLiteralResourceName: "a1"))
        let twitter = ActionButtonItem(title: "twitter", image: UIImage(imageLiteralResourceName: "a2"))
        let facebook = ActionButtonItem(title: "facebook", image: UIImage(imageLiteralResourceName: "a3"))
        let linkdin = ActionButtonItem(title: "linkdin", image: UIImage(imageLiteralResourceName: "a4"))
        
        
        actionButton = ActionButton(attachedToView: self.view, items: [google, twitter, facebook, linkdin])
        
        actionButton.setTitle("+", forState: UIControl.State())
        
        actionButton.backgroundColor = .cyan
        
        actionButton.action = {
            button in
            button.toggleMenu()
        }
    }
    
    


}

