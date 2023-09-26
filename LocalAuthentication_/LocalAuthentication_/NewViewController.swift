//
//  NewViewController.swift
//  LocalAuthentication_
//
//  Created by Adarsh Singh on 26/09/23.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet var txtfield: UITextField!
    @IBOutlet var lbl: UILabel!
    var text = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .brown
        txtfield.text = text
        lbl.text = text
    }

    

}
