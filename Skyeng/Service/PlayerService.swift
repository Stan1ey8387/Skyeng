//
//  PlayerService.swift
//  Skyeng
//
//  Created by Захар Бабкин on 16.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import AVFoundation

protocol PlayerProtocol {
    func play(url: URL)
}

final class PlayerService: PlayerProtocol {
    private var player: AVPlayer?
    
    func play(url: URL) {
        player?.pause()
        player = AVPlayer(playerItem: AVPlayerItem(url: url))
        player?.play()
    }
}
