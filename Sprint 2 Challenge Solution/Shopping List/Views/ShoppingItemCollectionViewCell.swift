//
//  ShoppingItemCollectionViewCell.swift
//  Sprint 2 Challenge
//
//  Created by Spencer Curtis on 7/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private Functions
    
    private func updateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        
        itemNameLabel.text = shoppingItem.name
        isAddedLabel.text = shoppingItem.isAddedToList ? "Added" : "Not Added"
        itemImageView.image = shoppingItem.image
        
        print(shoppingItem.name)
    }
    
    
    // MARK: - Properties
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var isAddedLabel: UILabel!
}
