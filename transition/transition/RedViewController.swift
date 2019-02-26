//
//  RedViewController.swift
//  transition
//
//  Created by Iyin Raphael on 8/30/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class RedViewController: UIViewController, LabelProviding, UIViewControllerTransitioningDelegate {
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            let location = sender.location(in: view)
            interactionController = UIPercentDrivenInteractiveTransition()
            if location.y < view.bounds.midY {
                close(sender)
            }
        case .changed:
            let translation = sender.translation(in: view)
            let percentageComplete = fabs(translation.y/ view.bounds.height)
            interactionController?.update(percentageComplete)
        case .ended
            if sender.velocity(in: view).y > 0 {
                interactionController?.finish()
            }else{
                interactionController?.cancel
            }
        default:
            break
        }
    }

    @IBAction func close(_ sender: Any) {
        transitioningDelegate = self
        dismiss(animated: true, completion: nil)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    @IBOutlet weak var label: UILabel!
    
    let animator = Animator()
}
