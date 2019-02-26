//
//  StarWarsTableViewCell.swift
//  StarWarsAPI
//
//  Created by Iyin Raphael on 8/14/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class StarWarsTableViewCell: UITableViewCell {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var BirthLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    var person: Person? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        
        guard let person = person else {return}
        nameLabel.text = person.name
        BirthLabel.text  = person.birth_year
        genderLabel.text = person.gender
    }
}
