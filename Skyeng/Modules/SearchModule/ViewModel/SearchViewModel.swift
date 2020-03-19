//
//  SearchSearchViewModel.swift
//  project
//
//  Created by Zakhar on 29/02/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

import Foundation

final class SearchViewModel: Routable {
    // MARK: Public property
    
    weak var view: SearchViewModelOutput?
    var router: SearchRouter?

    enum Routes {
        case word(id: Int)
    }
    
    // MARK: SearchViewModelInput Property
    
    var wordSectionViewModels = [WordSectionViewModel]()
    var meaningViewModels = [[MeaningViewModel?]]()
    
    // MARK:  Private property
    
    private let networkManager: SkyengNetworkProtocol
    private (set) var highlightedWords = [Bool]()
    private (set) var words = [Word]() {
        didSet {
            wordSectionViewModels = words.compactMap{ WordSectionViewModel(word: $0) }
            meaningViewModels = words.map{ ($0.meanings ).map{ (MeaningViewModel(meaning: $0) ?? nil)} }
        }
    }
    
    // MARK:  Init
    
    init(networkManager: SkyengNetworkProtocol) {
        self.networkManager = networkManager
    }
}


// MARK: SearchViewModelInput

extension SearchViewModel: SearchViewModelInput {
    func search(word: String) {
        view?.startActivity(style: .medium, isUserInteractionEnabled: true)
        
        networkManager.search(word: word) { [weak self] result in
            guard let self = self else { return }
            self.view?.stopActivity()
            
            switch result {
            case .success(let words):
                self.words = words
                self.highlightedWords = Array(repeating: false, count: words.count)
                
                if words.isEmpty {
                    self.view?.showAlert( "Nothing found", message: "Try to search something else", titleAction: "OK")
                }
                
                DispatchQueue.main.async {
                    self.view?.updateWords()
                }
            case .failure(let error):
                self.view?.showAlert("Error", message: error.localizedDescription, titleAction: "OK")
            }
            
        }
    }
    
    func didSelectRow(at section: Int) {
        if wordSectionViewModels[section].isHaveMore {
            highlightedWords[section].toggle()
            view?.updateSection(section)
        } else {
            if let meaning = words[section].meanings.first {
                router?.route(to: .word(id: meaning.id))
            }
        }
    } 
    
    func didSelectRow(at indexPath: IndexPath) {
        let meaning = words[indexPath.section].meanings[indexPath.row]
        router?.route(to: .word(id: meaning.id))
    }
    
    func getIsNeedExpand(for section: Int) -> Bool {
        return highlightedWords[section]
    }
}
