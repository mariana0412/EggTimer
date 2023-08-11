//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium": 7 * 60, "Hard": 10 * 60]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        if timer.isValid {
            endTimer()
        }
        
        let hardness = sender.currentTitle!
        setTitleLabel(label: hardness)
        
        resetProgressBar()
        
        totalTime = eggTimes[hardness]!
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(percentageProgress, animated: true)
        } else {
            endTimer()
            playAlarmSound()
            setTitleLabel(label: "Done!")
        }
    }
    
    func endTimer() {
        timer.invalidate()
        secondsPassed = 0
    }
    
    func resetProgressBar() {
        progressBar.setProgress(0.0, animated: false)
    }
    
    func setTitleLabel(label: String) {
        titleLabel.text = label
    }
    
    func playAlarmSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
