//
//  RoundedButton.swift
//  ProtonomeRoundedViews
//
//  Created by Daniel Clelland on 7/05/16.
//  Copyright © 2016 Daniel Clelland. All rights reserved.
//

import UIKit

@IBDesignable public class RoundedButton: UIButton {
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            configureView()
        }
    }
    
    @IBInspectable public var fillColor: UIColor? {
        didSet {
            configureView()
        }
    }
    
    @IBInspectable public var fillColorHighlighted: UIColor? {
        didSet {
            configureView()
        }
    }
    
    @IBInspectable public var fillColorSelected: UIColor? {
        didSet {
            configureView()
        }
    }
    
    // MARK: - Configuration
    
    private func configureView() {
        backgroundColor = UIColor.clearColor()
        setBackgroundImage(backgroundImageNormal, forState: .Normal)
        setBackgroundImage(backgroundImageHighlighted, forState: .Highlighted)
        setBackgroundImage(backgroundImageHighlighted, forState: [.Highlighted, .Selected])
        setBackgroundImage(backgroundImageSelected, forState: .Selected)
    }
    
    // MARK: - Private getters
    
    private var backgroundImageNormal: UIImage? {
        if let fillColor = fillColor {
            return UIImage.resizableImage(withColor: fillColor, andCornerRadius: cornerRadius)
        }
        return nil
    }
    
    private var backgroundImageHighlighted: UIImage? {
        if let fillColorHighlighted = fillColorHighlighted ?? fillColor {
            return UIImage.resizableImage(withColor: fillColorHighlighted, andCornerRadius: cornerRadius)
        }
        return nil
    }
    
    private var backgroundImageSelected: UIImage? {
        if let fillColorSelected = fillColorSelected ?? fillColor {
            return UIImage.resizableImage(withColor: fillColorSelected, andCornerRadius: cornerRadius)
        }
        return nil
    }

}

// MARK: - Private extensions

private extension UIImage {
    
    private static func resizableImage(withColor color: UIColor, andCornerRadius cornerRadius: CGFloat) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: cornerRadius * 2.0 + 1.0, height: cornerRadius * 2.0 + 1.0)
        let path = CGPathCreateWithRoundedRect(rect, cornerRadius, cornerRadius, nil)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.mainScreen().scale)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextAddPath(context, path)
        CGContextFillPath(context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image.resizableImageWithCapInsets(UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius), resizingMode: .Stretch)
    }
    
}
