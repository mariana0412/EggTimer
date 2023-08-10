//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 600]
    var countdownTimer: Timer!
    var secondsRemaining = 6
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        print(eggTimes[hardness]!)
    }
    
    @IBAction func timerTriggered(_ sender: UIButton) {
        startTimer()
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
    
    func endTimer() {
        print("Timer ended")
        countdownTimer.invalidate()
    }
}
