//
//  DetailViewController.swift
//  ProjectMilestone 10-12
//
//  Created by Adarsh Singh on 09/09/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imgViewDetail: UIImageView!
    
    var picture: [Person]!
    var n:URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgViewDetail.image =  UIImage(contentsOfFile: n.path())
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
