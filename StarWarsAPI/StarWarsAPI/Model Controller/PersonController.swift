//
//  PersonController.swift
//  StarWarsAPI
//
//  Created by Iyin Raphael on 8/14/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation



//Base URl
let baseURL = URL(string: "https://swapi.co/api/people")!

class PersonController {
    
    var people : [Person] = []
    
    //URL function to pull from API and adjusting it to fit the exact query
    func searchForPeopleWith(name: String,  completion:  @escaping () -> Void){
        //Breaking the URL Components
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        //more explanation on this tomorrow //add a querying Item
        let searchQueryItem = URLQueryItem(name: "search", value: name)
        urlComponents?.queryItems = [searchQueryItem]
    
        
     //Requesting
        guard let requestURL = urlComponents?.url else {print("your request urls is nil" ) ; completion() ; return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET" //there two tmajor types of request GET and PUT
        
         //Pulling data. anytime you fetch data you need a data task
        //what's the essence of data task
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
         
            if let error = error {
                print("Had probrem fetching data from JSON in the dataTask: \(error.localizedDescription)")
                completion()
            }
            guard let data = data else {print("No data Found") ; completion(); return}
            
            do {
                let decoder = JSONDecoder()
                let personSearchArray = try decoder.decode(PersonSearch.self, from: data)
                self.people = personSearchArray.results
                
            }
            catch {
                print("Unable to decode JSON")
            }
            
            print(data)
        }.resume()
      
        
    }
    
    
   
  
    
    
    
    
    
    //decode into model

}
