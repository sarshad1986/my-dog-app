//
//  Breed.swift
//  MyDogApp
//
//  Created by Sarah Arshad on 27/01/2023.
//

import Foundation

// codable means your struct can be converted from JSON or converted to JSON. Struct to map the data to once we get it back from the url.
struct Breed: Codable {
    let id: Int
    let name: String?
}
