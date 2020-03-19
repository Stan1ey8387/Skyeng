//
//  WordWordViewController.swift
//  project
//
//  Created by Zakhar on 16/03/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

import UIKit

final class WordViewController: UIViewController {
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var wordHeaderView: WordHeaderView!
    
    // MARK: Public property
    
    var viewModel: WordViewModelInput!
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.viewIsReady()
        addBehaviors(behaviors: [HideNavigationBarBehavior()])
    }

    // MARK: Private methods
    
    private func setupViews() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.alpha = 0
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(ExampleTableViewCell.self)
    }
}


// MARK: WordViewModelOutput

extension WordViewController: WordViewModelOutput {
    func update(with meaning: WordMeaning) {
        wordHeaderView.configurate(with: meaning)
        
        wordHeaderView.didAudioTapCompletion = { [weak self] audioLink in
            self?.viewModel.play(link: audioLink)
        }
        
        wordHeaderView.didBackTapCompletion = { [weak self] in
            self?.viewModel.back()
        }
        
        UIView.animate(withDuration: 0.3) {
            self.tableView.alpha = 1
        }
        
        tableView.reloadData()
    }
    
    func showAlert(_ title: String, message: String, titleAction: String) {
        self.showAlert(title, message: message, titleAction: titleAction, cancelAction: false)
    }
}


// MARK: UITableViewDataSource

extension WordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.exampleViewModels.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell.selectionStyle = .none
            cell.textLabel?.text = "[ \(viewModel.wordMeaning?.transcription ?? "") ]"
            cell.detailTextLabel?.numberOfLines = 0
            cell.detailTextLabel?.text = viewModel.wordMeaning?.definition.text
            
            return cell
        } else {
            let cell: ExampleTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.configurate(with: viewModel.exampleViewModels[indexPath.row - 1])
            cell.didAudioTapCompletion = { [weak self] audioLink in
                self?.viewModel.play(link: audioLink)
            }
            
            return cell
        }
    }
}


// MARK: UITableViewDelegate

extension WordViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
