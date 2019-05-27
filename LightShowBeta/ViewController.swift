//
//  ViewController.swift
//  LightShow
//
//  Created by Santiago Gutierrez on 5/22/19.
//  Copyright © 2019 zent. All rights reserved.
//

import UIKit
import CoreMIDI
import AudioKit

class ViewController: UIViewController, AKMIDIListener, AKMIDITransformer {
    
    override func viewDidLoad() {
        
        let midi = AudioKit.midi
        print(midi.inputNames)
        
        midi.openInput()
        midi.addListener(self)
        
        let tempo = TempoListener()
        tempo.addObserver(self)
        midi.addListener(tempo)
    }
    
    /*func transform(eventList: [AKMIDIEvent]) -> [AKMIDIEvent] {
        var newList = [AKMIDIEvent]();
        eventList.forEach { (event) in
            var mutableEvent = AKMIDIEvent(data: [0xF8])
            if let data = mutableEvent.data.first, data == 0xF8 {
                //mutableEvent.command = .clock
                
                print("clock...")
            }
            newList.append(event)
        }
        //print(eventList)
        return newList//[AKMIDIEvent(data: [0xF8])]
    }*/
    
}

extension ViewController: AKMIDITempoObserver {
    
    func receivedTempo(bpm: BPMType, label: String) {
        print("bpm: \(bpm) and label: \(label)")
    }
    
}
