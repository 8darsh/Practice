//
//  ViewController.swift
//  LocalNotification
//
//  Created by Adarsh Singh on 15/09/23.
//

import UIKit
import UserNotifications
class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let notificationCentre = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notificationCentre.delegate = self
        notificationCentre.requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
            
        }
    }

    @IBAction func notifyBtn(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        
        // notification content
        content.categoryIdentifier = "My Category Identifier"
        content.title = "Local Notification"
        content.body = "This is create example of local notification"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        //content Image
        
        guard let url = Bundle.main.url(forResource: "1", withExtension: "png") else { return }
        let attachment = try! UNNotificationAttachment(identifier: "image", url: url)
        content.attachments = [attachment]
        
        // time to trigger notification
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5, repeats: false)
        let identifier = "Main Identifier"
        let request = UNNotificationRequest.init(identifier: identifier, content: content, trigger: trigger)
        notificationCentre.add(request){
            error in
            print("\(error?.localizedDescription)")
        }
        
        //Notification action
        
        let like = UNNotificationAction.init(identifier: "Like", title: "Like", options: .foreground)
        let delete = UNNotificationAction.init(identifier: "delete", title: "Delete",options: .destructive)
        let category = UNNotificationCategory.init(identifier: content.categoryIdentifier, actions: [like, delete], intentIdentifiers: [])
        
        notificationCentre.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound,])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

