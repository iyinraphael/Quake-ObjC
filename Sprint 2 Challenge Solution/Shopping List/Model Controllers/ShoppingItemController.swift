//
//  ShoppingItemController.swift
//  Sprint 2 Challenge
//
//  Created by Spencer Curtis on 7/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    init() {
        createShoppingListItems()
        loadFromPersistentStore()
    }
    
    // MARK: - Create
    
    func createShoppingListItems() {
        
        guard UserDefaults.standard.bool(forKey: "ItemsHaveBeenCreated") != true else { return }
     
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        
        for itemName in itemNames {
            let item = ShoppingItem(name: itemName)
            shoppingListItems.append(item)
        }
        
        saveToPersistentStore()
        
        UserDefaults.standard.set(true, forKey: "ItemsHaveBeenCreated")
    }
    
    // MARK: - Update
    
    func updateIsAddedToList(forShoppingItem shoppingItem: ShoppingItem) {
        shoppingItem.isAddedToList = !shoppingItem.isAddedToList
        saveToPersistentStore()
    }
    
    // MARK: - Private Functions
    
    private func loadFromPersistentStore() {
        
        do {
            guard let fileURL = shopppingItemFileURL else { return }
            
            let shoppingItemsData = try Data(contentsOf: fileURL)
            
            let plistDecoder = PropertyListDecoder()
            
            self.shoppingListItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingItemsData)
            
        } catch {
            NSLog("Error decoding shopping list items from property list: \(error)")
        }
        
    }
    
    private func saveToPersistentStore() {
        
        let plistEncoder = PropertyListEncoder()
        
        do {
            let memoriesData = try plistEncoder.encode(shoppingListItems)
            
            guard let fileURL = shopppingItemFileURL else { return }
            
            try memoriesData.write(to: fileURL)
            
        } catch {
            NSLog("Error encoding shopping list items to property list: \(error)")
        }
        
    }
    
    private var shopppingItemFileURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "shoppingItems.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    // MARK: - Properties
    
    var shoppingListItems: [ShoppingItem] = []
    
}
