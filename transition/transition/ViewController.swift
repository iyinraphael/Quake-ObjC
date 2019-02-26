//
//  ViewController.swift
//  transition
//
//  Created by Iyin Raphael on 8/30/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
  let animator = Animator()

    @IBOutlet weak var label: UILabel!
    
}

