//
//  BreedsViewController.swift
//  MyDogApp
//
//  Created by Sarah Arshad on 23/01/2023.
//

import UIKit

class BreedsViewController: UIViewController, UICollectionViewDataSource {
    
    struct CellViewState {
        let text: String
    }
    
    struct ViewState {
        let header: String
        let items: [CellViewState]
    }
    
    //creates an instance of the struct so you can use it in the collection view functions below.
    var viewState: ViewState = .init(header: "", items: [])
    
    //creates an instance of the presenter when the view controller is initialised.
    var presenter: BreedsPresenter = .init(
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        presenter.viewController = self
        super.viewDidLoad()
        presenter.viewReady()
        // Do any additional setup after loading the view.
    }
    
    func render(_ viewState: ViewState) {
        self.viewState = viewState
        collectionView.reloadData()
    }
    
    //MARK: - Datasource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewState.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "breedCell", for: indexPath) as? BreedCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        let item = viewState.items[indexPath.item]
        cell.breedLabel?.text = item.text
        return cell
    }
}
