//
//  PerezFriendDetailViewController.swift
//  collectionPerez
//
//  Created by Iyin Raphael on 7/30/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class PerezFriendDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var favoriteTextField: UITextField!
    @IBOutlet weak var favoriteAppTextFied: UITextField!
    
    func updateViews(){
        guard let friend = friend else {
            title = "Add New Friend"
            return
        }
        
        nameTextField.text = friend.name
        favoriteTextField.text = friend.favoriteColor
        favoriteAppTextFied.text = friend.favoriteColor
    }
    
    
    @IBAction func save(_ sender: Any) {
    
        guard let name = nameTextField.text,
        let favoriteColor = favoriteTextField.text,
        let favoriteApp = favoriteAppTextFied.text else {return}
        
        if let friend = friend{
             perezFriendControllerOption?.update(friend: friend, name: name, favoriteColor: favoriteColor, favoriteApp: favoriteApp)
        }else{
            let _ = perezFriendControllerOption?.createPerezFriend(name: name, favoriteColor: favoriteColor, favoriteApp: favoriteApp)
        }
        
      navigationController?.popViewController(animated: true)
        
    }
    //instantiating controller waiting for it controller 
    var perezFriendControllerOption: PerezFreindsController?
    var friend: PerezFriend?{
        didSet{
            updateViews()
        }
    }
    
   


}
