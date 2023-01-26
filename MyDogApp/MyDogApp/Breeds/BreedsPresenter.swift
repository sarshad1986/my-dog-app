//
//  BreedsPresenter.swift
//  MyDogApp
//
//  Created by Sarah Arshad on 26/01/2023.
//

import Foundation

// contains the presentation logic for presenting to the screen.
class BreedsPresenter {
    
    weak var viewController: BreedsViewController?
    
    // called when view controller is ready to present something
    func viewReady() {
        loadModel()
    }
    
    func loadModel() {
       let state = buildViewState()
        viewController?.render(state)
    }
    
    func buildViewState() -> BreedsViewController.ViewState {
        return .init(items: [.init(text: "Hello dogs")])
    }
}

