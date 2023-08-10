//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7 * 60, "Hard": 10 * 60]
    var timer = Timer()
    var secondsRemaining = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        if timer.isValid == true {
            endTimer()
        }
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print(secondsRemaining)
            secondsRemaining -= 1
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        timer.invalidate()
        titleLabel.text = "End"
    }
}
