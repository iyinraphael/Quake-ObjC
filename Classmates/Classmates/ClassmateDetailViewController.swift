//
//  ClassmateDetailViewController.swift
//  Classmates
//
//  Created by owner on 7/23/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import UIKit

class ClassmateDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews() 

        // Do any additional setup after loading the view.
    }

    //MARK: Private
    private func updateViews() {
        guard let classmate = classmate else {
            title = "New Classmate"
            return
        }
        title = classmate.name
        
        nameTextField.text = classmate.name
        favoriteAppTextField.text = classmate.favoriteApp
        favoriteColorTextField.text = classmate.favoriteColor
    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text,
        let favoriteColor = favoriteColorTextField.text,
            let favoriteApp = favoriteAppTextField.text else {return}
    } 

    var classmate: Classmate?
    var classmateController: ClassmateContoller?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var favoriteColorTextField: UITextField!
    @IBOutlet weak var favoriteAppTextField: UITextField!
    
}
