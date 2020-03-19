//
//  MeaningTableViewCell.swift
//  Skyeng
//
//  Created by Захар Бабкин on 15.03.2020.
//  Copyright © 2020 Захар Бабкин. All rights reserved.
//

import UIKit

final class MeaningTableViewCell: UITableViewCell, ReusableView, NibLoadableView   {
    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var translateLabel: UILabel!
    
    func configurate(with meaningViewModel: MeaningViewModel) {
        previewImageView.setImage(url: meaningViewModel.previewUrl, indicator: true)
        translateLabel.text = meaningViewModel.translate
    }
}
