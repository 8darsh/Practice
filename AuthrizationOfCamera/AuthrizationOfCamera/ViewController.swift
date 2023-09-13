//
//  ViewController.swift
//  AuthrizationOfCamera
//
//  Created by Adarsh Singh on 12/09/23.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(checkCameraPermission))
    }


}
extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    
    func presentCameraSetting(){
        
        let ac = UIAlertController(title: "Error", message: "Camera access is denied", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Cancel", style: .default))
        ac.addAction(UIAlertAction(title: "Settings", style: .cancel){
            _ in
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:])
            }
        })
        
        present(ac, animated: true)
    }
    
    @objc func checkCameraPermission(){
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authStatus {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { success in
                if success{
                    print("Permission Granted")
                }else{
                    print("Permission not Granted")
                }
            }
            break
        case .restricted:
            print("User Don't allow")
            break
        case .denied:
            print("Denied Status Called")
            self.presentCameraSetting()
            break
        case .authorized:
            print("Success!")
            self.callCamera()
            break
        @unknown default:
            fatalError()
        }
    }
    
    @objc func callCamera(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        self.present(picker, animated: true)
        
    }
}

