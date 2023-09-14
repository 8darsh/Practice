//
//  ViewController.swift
//  DeviceOrientation
//
//  Created by Adarsh Singh on 13/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detectDevice()
        imgView.image = UIImage(imageLiteralResourceName: "1")
    }
    
    //Device ko detect karega
    func detectDevice(){
        
        if UIDevice().userInterfaceIdiom == .phone{
            
            switch UIScreen.main.nativeBounds.height{ // acc to the device height
                
            case 1136:                        //1136 device ki height hai
                print("iphone 5")
            case 1334:
                print("iphone 6/6s/7/8")
            case 1920, 2208:
                print("iPhone +")
            case 1436:
                print("iPhone X")
                
            default:
                print("Android")
            }
        }
    }
    
    // Device ki orientation landscape or potrait
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if UIDevice.current.orientation.isLandscape{
            print("landscape mode is active")
            imgView.image = UIImage(imageLiteralResourceName: "1")
        }else{
            print("potrait mode is active")
            imgView.image = UIImage(imageLiteralResourceName: "2")
        }
        
    }
    
    


}

