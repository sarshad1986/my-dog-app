//
//  FetchService.swift
//  MyDogApp
//
//  Created by Sarah Arshad on 27/01/2023.
//

import Foundation

class FetchService {
    
    // Use a URL session instance to create the task inorder to fetch the data.
    let networkSession = URLSession.shared
    let decoder = JSONDecoder()
    
    func fetchAllBreeds(completionHandler: @escaping ([Breed]) -> ()) {
        
        let url = URL(string: "https://api.thedogapi.com/v1/breeds?limit=10&page=0")!
        let request = URLRequest(url: url)
        
        // Creates a data task that retrieves the contents of the url and delivers it's results(the server's response, data and errors) to a call back function/completon closure that gets executed once the request completes.
        let dataTask = networkSession.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data else {
                return
            }
            //We need to convert the JSON data to the Swift struct. We do this using JSON decoder.
            //Why do you need to specify .self? [Breed].self is the name of the type. It's Swift's way of referring to the [Breed] type itself and not an instance of it. We're not saying "create a new one", but instead specifying it as a parameter to the decoding so JSONDecoder knows what to convert the JSON to.
            let breeds = try? self.decoder.decode([Breed].self, from: data)
            print(breeds)
            
            // if the completion handler returns nil breeds then return an empty array.
            completionHandler(breeds ?? [])
        })
        // The task is created in a suspended state so to make it actually fire a request we have to resume the task.
        dataTask.resume()
        
//        return [ .init(id: 1, name: "Labrador"), .init(id: 2, name: "Cockapoo")]
    }
    
    
}
