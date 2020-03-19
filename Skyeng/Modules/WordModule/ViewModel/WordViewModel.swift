//
//  WordWordViewModel.swift
//  project
//
//  Created by Zakhar on 16/03/2020.
//  Copyright © 2020 Zakhar Babkin. All rights reserved.
//

import Foundation

final class WordViewModel: Routable {
    // MARK: Public property
    weak var view: WordViewModelOutput?
    var router: WordRouter?
     
    enum Routes {
    }
    
    // MARK: Private property
    
    private let id: Int
    private let networkManager: SkyengNetworkProtocol
    private let player: PlayerProtocol
    
    // MARK: WordViewModelInput property
     
    var exampleViewModels = [ExampleViewModel]()
    var wordMeaning: WordMeaning? {
        didSet {
            exampleViewModels = (wordMeaning?.examples ?? []).compactMap{ ExampleViewModel(definition: $0) }
        }
    }
    
    // MARK: Init
    
    init(id: Int, networkManager: SkyengNetworkProtocol, player: PlayerProtocol) {
        self.id = id
        self.networkManager = networkManager
        self.player = player
    }
    
    // MARK: Private methods
    
    private func getMeaning() {
        view?.startActivity(style: .medium, isUserInteractionEnabled: true)
        
        networkManager.getMeaning(by: id){ [weak self] result in
            guard let self = self else { return }
            self.view?.stopActivity()
            
            switch result {
            case .success(let wordsMeaning):
                if let wordMeaning = wordsMeaning.first {
                    self.wordMeaning = wordMeaning
                    DispatchQueue.main.async {
                        self.view?.update(with: wordMeaning)
                        self.play(link: wordMeaning.soundUrl ?? "")
                    }
                }
            case .failure(let error):
                self.view?.showAlert("Error", message: error.localizedDescription, titleAction: "OK")
            }
            
        }
    }
}


// MARK: WordViewModelInput

extension WordViewModel: WordViewModelInput {
    func viewIsReady() {
        getMeaning()
    }
    
    func play(link: String) {
        if let audioUrl = URL(httpsString: link) {
            player.play(url: audioUrl)
        }
    }
    
    func back() {
        router?.close()
    }
}
