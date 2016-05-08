//
//  RoundedView.swift
//  ProtonomeRoundedViews
//
//  Created by Daniel Clelland on 1/05/16.
//  Copyright © 2016 Daniel Clelland. All rights reserved.
//

import UIKit

@IBDesignable public class RoundedView: UIView {
    
    // MARK: - Properties
    
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
    
    // MARK: - Configuration
    
    private func configureView() {
        backgroundColor = UIColor.clearColor()
        setNeedsDisplay()
    }
    
    // MARK: - Overrides
    
    override public func drawRect(rect: CGRect) {
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), fillColor?.CGColor)
        backgroundPath.fill()
        super.drawRect(rect)
    }
    
    // MARK: - Private getters
    
    private var backgroundPath: UIBezierPath {
        return UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    }
    
}
