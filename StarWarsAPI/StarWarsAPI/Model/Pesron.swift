//
//  Pesron.swift
//  StarWarsAPI
//
//  Created by Iyin Raphael on 8/14/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation


struct Person: Decodable {
    
    let name: String
    let birth_year: String
    let  gender: String
}


//we have a stuct with an array because the properties in the api are all in an array
struct PersonSearch: Decodable {
    
    let results: [Person]
}
