//
//  MicMonitor.swift
//  Lris
//
//  Created by [Andy Ron](https://github.com/andyRon)  on 2018/11/14.
//  Copyright © 2018 [Andy Ron](https://github.com/andyRon) . All rights reserved.
//

import UIKit
import AVFoundation

class MicMonitor: NSObject {
    
    private var recorder: AVAudioRecorder!
    private var timer: Timer?
    private var levelsHandler: ((Float) -> Void )?
    
    override init() {
        
        let url = URL(fileURLWithPath: "/dev/null", isDirectory: true)
        let settings: [String: Any] = [
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless),
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
        ]
        
        let audioSession = AVAudioSession.sharedInstance()
        
        if audioSession.recordPermission != .granted {
            audioSession.requestRecordPermission({success in print("microphone permission: \(success)") })
        }
        
        do {
            try recorder = AVAudioRecorder(url: url, settings: settings)
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .default, options: [])
        } catch {
            print("Couldn't")
        }
        
        if let recorder = recorder {
            recorder.prepareToRecord()
            recorder.isMeteringEnabled = true
        }
    }
    
    func startMonitoringWithHandler(_ handler: ((Float) -> Void)?) {
        levelsHandler = handler
        
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(MicMonitor.handleMicLevel(_:)), userInfo: nil, repeats: true)
        recorder.record()
    }
    
    func stopMonitoring() {
        levelsHandler = nil
        timer?.invalidate()
        recorder.stop()
    }
    
    @objc func handleMicLevel(_ timer: Timer) {
        recorder.updateMeters()
        levelsHandler?(recorder.averagePower(forChannel: 0))
    }
    
    deinit {
        stopMonitoring()
    }
}
