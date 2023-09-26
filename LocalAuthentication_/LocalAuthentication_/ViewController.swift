//
//  ViewController.swift
//  LocalAuthentication_
//
//  Created by Adarsh Singh on 26/09/23.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        var context = LAContext()
        var biometry = context.biometryType
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            let reason = "Identify yourself!"

            // Face Id
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        let vc = self?.storyboard?.instantiateViewController(withIdentifier: "NewViewController") as!
                        NewViewController
                        self?.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            }
            //Touch Id
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
//                DispatchQueue.main.async {
//                    if success {
//                       
//                    } else {
//                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
//                        ac.addAction(UIAlertAction(title: "OK", style: .default))
//                        self.present(ac, animated: true)
//                    }
//                }
//            }
        } else {
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }


}

