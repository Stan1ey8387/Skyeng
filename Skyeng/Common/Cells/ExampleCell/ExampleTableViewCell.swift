//
//  ExampleTableViewCell.swift
//  Skyeng
//
//  Created by Захар Бабкин on 17.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//


import UIKit

final class ExampleTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var exampleTextLabel: UILabel!
      
    var didAudioTapCompletion: ((String) -> ())?
    
    private var exampleViewModel: ExampleViewModel!
    
    func configurate(with exampleViewModel: ExampleViewModel) {
        self.exampleViewModel = exampleViewModel
        exampleTextLabel.text = exampleViewModel.exampleText
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        didAudioTapCompletion?(exampleViewModel.audioLink)
    }
}
