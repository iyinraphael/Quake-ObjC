//
//  ShoppingItemListCollectionViewController.swift
//  Sprint 2 Challenge
//
//  Created by Spencer Curtis on 7/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemListCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shoppingItem = shoppingItemController.shoppingListItems[indexPath.row]
        
        shoppingItemController.updateIsAddedToList(forShoppingItem: shoppingItem)
        
        collectionView.reloadItems(at: [indexPath])
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingListItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { fatalError("Cell must have reuse identifier ShoppingItemCell, and be of type ShoppingItemCollectionViewCell") }
    
        let shoppingItem = shoppingItemController.shoppingListItems[indexPath.row]
        
        cell.shoppingItem = shoppingItem
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "ToSendOrderVC" else { return }
        
        let sendOrderVC = segue.destination as? SendOrderViewController
        
        sendOrderVC?.shoppingItemController = shoppingItemController
    }
    
    // MARK: - Properties
    
    let shoppingItemController = ShoppingItemController()
}
