//
//  Animator.swift
//  transition
//
//  Created by Iyin Raphael on 8/30/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

protocol LabelProviding {
    var label: UILabel {get }
}

typealias LabelProvidingVC = LabelProviding & UIViewController

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) as? LabelProvidingVC,
        let toVC = transitionContext.viewController(forKey: .to) as? LabelProvidingVC,
        let toView = transitionContext.view(forKey: .to) else { return}
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        
        let sourceLabel = fromVC.label!
        let destinationLabel = toVC.label
        sourceLabel.alpha = 0.0
        destinationLabel.alpha = 0.0
        
        let labelInitialFram = ContainerView.convert(sourceLabel.bounds, from: sourceLabel)
        let animatedLabel = UILabel(frame: labelInitialFram)
        animatedLabel.text = sourceLabel.text
        animatedLabel.font = sourceLabel.font
        containerView.addsubView(animatedLabel)
        
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            toView.alpha = 1.0
        }) { (success) in
            sourceLabel.alpha = 1.0
            destinationLabel.alpha = 1.0
            animatedLabel.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
