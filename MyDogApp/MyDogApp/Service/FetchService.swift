//
//  FetchService.swift
//  MyDogApp
//
//  Created by Sarah Arshad on 27/01/2023.
//

import Foundation

class FetchService {
    
    func fetchAllBreeds() -> [Breed] {
        
        return [ .init(id: 1, name: "Labrador"), .init(id: 2, name: "Cockapoo")]
    }
    
    
}
