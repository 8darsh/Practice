//
//  ViewController.swift
//  Stopwatch
//
//  Created by Adarsh Singh on 11/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playPause: UIButton!
    
    @IBOutlet var timerLbl: UILabel!
    
    var counter = 00.00
    var timer = Timer()
    var isRunning = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        timerLbl.text = "\(counter)"
        playPause.isEnabled = true
        playPause.isSelected = false
        
    }

    @IBAction func resetAction(_ sender: UIBarButtonItem) {
        
        timer.invalidate()
        timerLbl.text = "00.00"
        counter = 0.0
        playPause.isEnabled = true
        
        
        
    }
    
    @IBAction func playpauseBtn(_ sender: UIButton) {
        


        if !playPause.isSelected{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            playPause.isEnabled = true
            playPause.isSelected = true
            
            
        }else{
            timer.invalidate()
            playPause.isEnabled = true
            playPause.isSelected = false
            
            
        }
        
        
    }
    @objc
    func updateTimer(){
        
        counter += 0.1
        timerLbl.text = String(format: "%.1f", counter)
    }
        
    
    
    
}

