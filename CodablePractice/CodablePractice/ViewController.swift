//
//  ViewController.swift
//  CodablePractice
//
//  Created by Iyin Raphael on 8/31/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testPersonDecoding()
    }
    
    func testPersonDecoding(){
        guard let url = Bundle.main.url(forResource: "examplePerson", withExtension: "json") else{
           print("URL is bad")
            return
        }
        do {
            let exampleData = try Data(contentsOf: url)
            let person = try JSONDecoder().decode(Pearson.self, from: exampleData)
    
            print("Error")
        }catch{
            print("Error: \(error)")
        }
    }
    
    
    
    func testPersonEecoding(){
        guard let url = Bundle.main.url(forResource: "examplePerson", withExtension: "json") else{
            print("URL is bad")
            return
        }
        do {
            let exampleData = try Data(contentsOf: url)
            let person = try JSONEncoder.encode(Pearson.self, from: exampleData)
            
            print("Error")
        }catch{
            print("Error: \(error)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

