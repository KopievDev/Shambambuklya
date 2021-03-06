//
//  Haptic.swift
//  Shambambuklya
//
//  Created by Ivan Kopiev on 18.02.2022.
//

import UIKit
import AVFoundation

enum Haptic {
    
   static func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: style)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
    static func selection() {
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.selectionChanged()
    }
    
    static func notification(_ style:UINotificationFeedbackGenerator.FeedbackType) {
        let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
        notificationFeedbackGenerator.prepare()
        notificationFeedbackGenerator.notificationOccurred(style)
    }
        
}

enum Speaker {
    static func say(text: String, rate: Float = 0.5, afterTime: Double = 0) {
        let queque = DispatchQueue(label: "Speaker", qos: .userInitiated, attributes: .concurrent)
        queque.asyncAfter(deadline: .now() + afterTime) {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
            utterance.rate = rate
            utterance.pitchMultiplier = 1.5
            let synth = AVSpeechSynthesizer()
            synth.speak(utterance)
        }
    }
}

