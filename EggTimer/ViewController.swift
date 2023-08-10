//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 10]
    var countdownTimer: Timer!
    var secondsRemaining = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        print(eggTimes[hardness]!)
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print(secondsRemaining)
            secondsRemaining -= 1
        } else {
            endTimer()
        }
    }
    
    @objc func endTimer() {
        print("Timer ended")
        countdownTimer.invalidate()
    }
}
