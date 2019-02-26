//
//  SendOrderViewController.swift
//  Sprint 2 Challenge
//
//  Created by Spencer Curtis on 7/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    // MARK: - Private Functions
    
    private func updateViews() {
        itemCountLabel.text = "You currently have \(shoppingItemController.shoppingListItems.filter({$0.isAddedToList}).count) item(s) in your shopping list."
        
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        localNotificationHelper.getAuthorizationStatus { (status) in
            
            switch status {
                
            case .authorized:
                
                self.localNotificationHelper.scheduleOrderDeliveryNotification(withName: name, andAddress: address)
                
            case .denied:
                
                NSLog("User has denied authorization to receive local notifications")
                
            case .notDetermined:
                
                self.localNotificationHelper.requestAuthorization(completion: { (success) in
                    
                    guard success else { NSLog("User has denied authorization to receive local notifications"); return }
                    
                    self.localNotificationHelper.scheduleOrderDeliveryNotification(withName: name, andAddress: address)
                })
            }
        }
    }
    
    // MARK: - Properties

    var shoppingItemController: ShoppingItemController!
    let localNotificationHelper = LocalNotificationHelper()
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
}
