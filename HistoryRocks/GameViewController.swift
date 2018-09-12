//
//  Game
//ViewController.swift
//  HistoryRocks
//
//  Created by Peter Reichl on 8/29/18.
//  Copyright © 2018 Peter Reichl. All rights reserved.
//

import UIKit
import AudioUnit

class GameViewController: UIViewController {
    
    var timer = Timer()
    var time: Int = 60
    var correctSound: SystemSoundID = 0
    var incorrectSound: SystemSoundID = 1
    
    var gameOn: Bool = false
    var roundActive: Bool = false
    
    @IBOutlet weak var shakeLabel: UILabel!
    
    @IBOutlet weak var nextRoundLabel: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var eventButtonOne: UIButton!
    @IBOutlet weak var eventButtonTwo: UIButton!
    @IBOutlet weak var eventButtonThree: UIButton!
    @IBOutlet weak var eventButtonFour: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        nextRoundLabel.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if roundsPlayed == 0 {
            nextRoundLabel.isHidden = false
            nextRoundLabel.setBackgroundImage(UIImage(named: "play_button.png"), for: .normal)
        } else if gameOn == false && roundActive == false && roundsPlayed < 6 {
            //startRound()
            nextRoundLabel.isHidden = false
        } else {
            correctAnswers = 0
            roundsPlayed = 0
            gameOn = true
            startRound()
        }
    }
    
//    func setFirstScreen() {
//        let image: UIImage
//        if roundsPlayed == 0 {
//            startRound()
//        } else {
//            nextRoundLabel.isHidden = false
//            image = UIImage(named: "play_button.png")!
//             nextRoundLabel.setBackgroundImage(image, for: .normal)
//        }
//
//    }

    func startRound() {
        gameOn = true
        roundActive = true
        nextRoundLabel.isHidden = true
        timerLabel.isHidden = false
        shakeLabel.isHidden = false
        time = 60
        startTimer()
        decreaseTimer()
        roundsPlayed += 1
        eventRound = createRound()
        shakeLabel.text = "Shake To Complete"
        loadRound()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    
    func endRound() {
        gameOn = false
        roundActive = false
        timerLabel.isHidden = true
        shakeLabel.text = "Tap Events For Info"
        nextRoundLabel.isHidden = false
        timer.invalidate()
        let image: UIImage
        if eventRound.orderedCorrectly() == true {
            correctAnswerSound()
            AudioServicesPlaySystemSound(correctSound)
            nextRoundLabel.isHidden = false
            image = UIImage(named: "next_round_success.png")!
            correctAnswers += 1
        } else {
            incorrectAnswerSound()
            AudioServicesPlaySystemSound(incorrectSound)
            image = UIImage(named: "next_round_fail.png")!
        }
        nextRoundLabel.setBackgroundImage(image, for: .normal)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            endRound()
        }
    }
    
    
    func loadRound() {
        var attributedString = NSMutableAttributedString(string: eventRound.events[0].description)
        eventButtonOne.setAttributedTitle(attributedString, for: .normal)
        attributedString = NSMutableAttributedString(string: eventRound.events[1].description)
        eventButtonTwo.setAttributedTitle(attributedString, for: .normal)
        attributedString = NSMutableAttributedString(string: eventRound.events[2].description)
        eventButtonThree.setAttributedTitle(attributedString, for: .normal)
        attributedString = NSMutableAttributedString(string: eventRound.events[3].description)
        eventButtonFour.setAttributedTitle(attributedString, for: .normal)
        
    }
    
    @objc func decreaseTimer() {
        timerLabel.text = ":\(time)"
        
        if time > 0 {
            time -= 1
        } else {
            time = 60
            endRound()
        }
    }
    
    
    func correctAnswerSound() {
        let path = Bundle.main.path(forResource: "CorrectDing", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &correctSound)
    }
    
    func incorrectAnswerSound() {
        let path = Bundle.main.path(forResource: "IncorrectBuzz", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &incorrectSound)
    }
    
    @IBAction func buttonOneDownPressed(_ sender: Any) {
        eventRound.events.swapAt(0, 1)
        loadRound()
    }
    
    @IBAction func buttonTwoUpPressed(_ sender: Any) {
        eventRound.events.swapAt(1, 0)
        loadRound()
    }
    
    @IBAction func buttonTwoDownPressed(_ sender: Any) {
        eventRound.events.swapAt(1, 2)
        loadRound()
        
    }
    
    @IBAction func buttonThreeUpPressed(_ sender: Any) {
        eventRound.events.swapAt(2, 1)
        loadRound()
    }
    
    @IBAction func buttonThreeDownPressed(_ sender: Any) {
        eventRound.events.swapAt(2, 3)
        loadRound()
    }
    
    @IBAction func buttonFourUpPressed(_ sender: Any) {
        eventRound.events.swapAt(3, 2)
        loadRound()
    }
    
    
    
    

    @IBAction func buttonOneTapped(_ sender: Any) {
        if roundActive == false {
            selectedEvent = eventRound.events[0]
            self.performSegue(withIdentifier: "goToWebInfo", sender: nil)
        }
    }
    
    @IBAction func buttonTwoTapped(_ sender: Any) {
        if roundActive == false {
            selectedEvent = eventRound.events[1]
            self.performSegue(withIdentifier: "goToWebInfo", sender: nil)
        }
    }
    
    @IBAction func buttonThreeTapped(_ sender: Any) {
        if roundActive == false {
            selectedEvent = eventRound.events[2]
            self.performSegue(withIdentifier: "goToWebInfo", sender: nil)
        }
    }
    
    @IBAction func buttonFourTapped(_ sender: Any) {
        if roundActive == false {
            selectedEvent = eventRound.events[3]
            self.performSegue(withIdentifier: "goToWebInfo", sender: nil)
        }
    }
    
    
    
    @IBAction func nextRoundPressed(_ sender: Any) {
        if roundsPlayed < 6 {
            startRound()
        } else {
            gameOn = false
            timer.invalidate()
            self.performSegue(withIdentifier: "goToResults", sender: Any?.self)
        }
    }
    
    
}
























