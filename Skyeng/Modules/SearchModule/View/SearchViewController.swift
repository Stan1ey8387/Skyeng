//
//  SearchSearchViewController.swift
//  project
//
//  Created by Zakhar on 29/02/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    // MARK: IBOutlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Public property
    
    var viewModel: SearchViewModelInput!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: Private methods
    
    private func setupViews() {
        title = "Search"
        searchBar.placeholder = "Search"
        searchBar.becomeFirstResponder()
         
        setupTableView()
        setupNavigationBar()
        setupKeyboardObserver()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backIndicatorImage = UIImage()
    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = 0
        tableView.register(WordSectionTableViewCell.self)
        tableView.register(MeaningTableViewCell.self)
    }
    
    private func setupKeyboardObserver() {
        KeyboardObserver.willShow { [weak self] keyboardHeight in
            self?.tableView.contentInset.bottom = keyboardHeight
        }
        
        KeyboardObserver.willHide { [weak self] _ in
            self?.tableView.contentInset.bottom = 0
        }
    }
}


// MARK: SearchViewModelOutput

extension SearchViewController: SearchViewModelOutput {
    func updateWords() {
        tableView.reloadData()
    }
    
    func updateSection(_ section: Int) {
        tableView.reloadData()
    }
    
    func showAlert(_ title: String, message: String, titleAction: String) {
        self.showAlert(title, message: message, titleAction: titleAction, cancelAction: false)
    }
}


// MARK: UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.wordSectionViewModels.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: WordSectionTableViewCell = tableView.dequeueReusableHeaderCell()
        cell.configurate(with: viewModel.wordSectionViewModels[section])
        cell.didTapCompletion = { [weak self] in
            self?.viewModel.didSelectRow(at: section)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.getIsNeedExpand(for: section) {
            return viewModel.meaningViewModels[section].count
        } else {
            return 0
        } 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MeaningTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        if let meaningViewModel = viewModel.meaningViewModels[indexPath.section][indexPath.row] {
            cell.configurate(with: meaningViewModel)
        }

        return cell
    }
}


// MARK: UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}


// MARK: UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, searchText != "" {
            viewModel.search(word: searchText)
            searchBar.endEditing(true)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
