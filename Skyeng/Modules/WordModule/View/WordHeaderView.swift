//
//  WordHeaderView.swift
//  Skyeng
//
//  Created by Захар Бабкин on 16.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import UIKit

final class WordHeaderView: UIView, ReusableView, NibLoadableView {
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var translateLabel: UILabel!
    
    private var audioLink: String?
    
    var didBackTapCompletion: (() -> ())?
    var didAudioTapCompletion: ((String) -> ())?
    
    func configurate(with meaning: WordMeaning) {
        if let link = meaning.images?.first?.url, let url = URL(httpsString: link) {
            previewImageView.setImage(url: url)
        }
        wordLabel.text = meaning.text
        translateLabel.text = meaning.translation?.text
        
        if let text = meaning.translation?.text, let note = meaning.translation?.note, note != "" {
            translateLabel.text = "\(text) (\(note))"
        }
        
        audioLink = meaning.soundUrl
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        didBackTapCompletion?()
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        guard let audioLink = audioLink else {
            UIView.animate(withDuration: 1, animations: {
                sender.backgroundColor = .red
            }, completion: { (_) in
                UIView.animate(withDuration: 1, animations: {
                    sender.backgroundColor = .clear
                })
            })
            return }
        
        didAudioTapCompletion?(audioLink)
    }
}
