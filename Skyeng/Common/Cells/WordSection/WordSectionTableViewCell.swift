//
//  WordSectionTableViewCell.swift
//  Skyeng
//
//  Created by Захар Бабкин on 15.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import UIKit

final class WordSectionTableViewCell: UITableViewCell, ReusableView, NibLoadableView  {
    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet weak var meaningsCount: UILabel!
    @IBOutlet private weak var translateLabel: UILabel!
    @IBOutlet private weak var meaningsLabel: UILabel!
    @IBOutlet private weak var expandButton: UIButton!
    
    var didTapCompletion: (() -> ())?
    
    func configurate(with wordSectionViewModel: WordSectionViewModel) {
        previewImageView.setImage(url: wordSectionViewModel.previewUrl, indicator: true)
        previewImageView.isHidden = wordSectionViewModel.isHaveMore
        meaningsCount.text = wordSectionViewModel.meaningsCount
        translateLabel.text = wordSectionViewModel.translate
        meaningsLabel.text = wordSectionViewModel.meanings
        expandButton.isHidden = !wordSectionViewModel.isHaveMore
    }
    
    @IBAction func didTapAction(_ sender: Any) {
        didTapCompletion?()
    }
}
