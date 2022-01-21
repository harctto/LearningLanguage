//
//  Extension.swift
//  myApp
//
//  Created by Hatto on 11/6/2564 BE.
//

import UIKit

//HEX Color
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIView {
    //DropShadow
    func colorAndCorner(color: UIColor , cornerRadius: CGFloat) {
        backgroundColor = color
        layer.cornerRadius = cornerRadius
    }
    
    func dropShadow(bound: Bool) {
        layer.masksToBounds = bound
        layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
    }
    
    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: nil)
        
    }
    
    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
    
    func animateViewBtn(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }, completion: { (_) in
            UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        })
    }
    
}

extension UIViewController {
    func presentInFullScreen(_ viewController: UIViewController,
                             animated: Bool,
                             completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: animated, completion: completion)
    }
}
