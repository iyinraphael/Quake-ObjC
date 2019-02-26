//
//  Person.swift
//  CodablePractice
//
//  Created by Iyin Raphael on 8/31/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

struct Pearson: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case hairColor = "hair_color"
        case films
        case starships
    }
    
    
    init(from decoder: Decoder) throws {
        //Container
        let container = try
            decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let heightString = try container.decode(String.self, forKey: .height)
        let height = Int(heightString) ?? 0
        //use decodeIFPresent if you are not sure the property is in the json
        let hairColor = try container.decode(String.self, forKey: .hairColor)
        let filmString = try container.decode([String].self, forKey: .films)
        
        var starshipsContainer = try container.nestedUnkeyedContainer(forKey: .starships)
        var starshipURLString: [String] = []
        while !starshipsContainer.isAtEnd{
            var starshipURLString = try starshipsContainer.decode(String.self)
            starshipURLString.append(starshipURLString)
        }
        //compactMap unwraps the optional
        let starshipURLs = starshipURLString.compactMap({URL(string: $0)})
        let films = filmString.compactMap({URL(string: $0)})
        
        self.name = name
        self.films  = films
        self.starships = starshipURLs
        self.hairColor = hairColor
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(height, forKey: .height)
        try container .encode(hairColor, forKey: .hairColor)
        
        //Encoding Arrays MEthod 1
        let filmsStrings = films.map({$0.absoluteString})
        try container.encode(filmsStrings, forKey: .films)
        
        
        //Encoding Arrays Method 2
        var starshipsContainer = container.nestedUnkeyedContainer(forKey: .starships)
        
        for starship in starships {
            try starshipsContainer.encode(starship.absoluteString)
        }
        
    }
    
    
    
    let name: String
    let height: Int
    let hairColor: String
    let films: [URL]
    let starships: [URL]
}
