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
        let items: [CellViewState]
    }
    
    //creates an instance of the struct so you can use it in the collection view functions below.
    var viewState: ViewState = .init(items: [])
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
