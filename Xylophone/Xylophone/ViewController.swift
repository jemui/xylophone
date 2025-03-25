//
//  ViewController.swift
//  Xylophone
//
//  Created by Jeanette on 1/22/25.
//  

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else { return }
        
        playSound(buttonText)
        buttonPressed(sender)
    }
    
    func playSound(_ buttonText: String) {
        let url = Bundle.main.url(forResource: buttonText, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func buttonPressed(_ button: UIButton) {
        button.alpha = 0.5;
        
        Task { @MainActor in
            let seconds = Utility.toNanoseconds(seconds: 0.2)
            try await Task.sleep(nanoseconds: seconds)
            button.alpha = 1;
        }
    }
    
    func onButtonUp(_ button: UIButton) {
        button.alpha = 1;
    }
}

