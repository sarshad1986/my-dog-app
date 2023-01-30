//
//  BreedsPresenter.swift
//  MyDogApp
//
//  Created by Sarah Arshad on 26/01/2023.
//

import Foundation

// contains the presentation logic for presenting to the screen.
class BreedsPresenter {
    
    let service: FetchService = .init()
    
    // view controller doesn't need to be initialised like the service above because it's initialised by UIKit when the app starts.
    weak var viewController: BreedsViewController?
    
    // called when view controller is ready to present something
    func viewReady() {
        loadModel()
    }
    
    func loadModel() {
        let allBreeds = service.fetchAllBreeds()
        let stateOfEntireScreen = buildViewState(breeds: allBreeds)
        viewController?.render(stateOfEntireScreen)
//       let state = buildViewState()
//        viewController?.render(state)
    }
    
    func buildViewState(breeds: [Breed]) -> BreedsViewController.ViewState {
        let cellViewStates = breeds.map { breed in
            return self.buildCellViewState(for: breed)
        }
        let header = "total number of dog breeds: \(breeds.count)"
        
        return BreedsViewController.ViewState(header: header, items: cellViewStates)

        //return .init(items: [.init(text: "Hello dogs")])
        //same as return BreedsViewController.ViewState(items: [BreedsViewController.CellViewState(text: "Hello dog")])
    }
    
    func buildCellViewState(for breed: Breed) -> BreedsViewController.CellViewState {
        return BreedsViewController.CellViewState(text: breed.name ?? "No name")
    }
}

