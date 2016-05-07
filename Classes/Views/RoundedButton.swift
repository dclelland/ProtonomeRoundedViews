//
//  RoundedButton.swift
//  ProtonomeRoundedViews
//
//  Created by Daniel Clelland on 7/05/16.
//  Copyright © 2016 Daniel Clelland. All rights reserved.
//

import UIKit

@IBDesignable public class RoundedButton: UIButton {
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 { didSet { configureImages() } }
    
    @IBInspectable public var backgroundColorNormal: UIColor? = nil { didSet { configureImages() } }
    @IBInspectable public var backgroundColorHighlighted: UIColor? = nil { didSet { configureImages() } }
    @IBInspectable public var backgroundColorSelected: UIColor? = nil { didSet { configureImages() } }
    
    // MARK: - Configuration
    
    private func configureImages() {
        backgroundColor = UIColor.clearColor()
        
        setBackgroundImage(backgroundImageNormal, forState: .Normal)
        setBackgroundImage(backgroundImageHighlighted, forState: .Highlighted)
        setBackgroundImage(backgroundImageHighlighted, forState: [.Highlighted, .Selected])
        setBackgroundImage(backgroundImageSelected, forState: .Selected)
    }
    
    // MARK: - Private getters
    
    private var backgroundImageNormal: UIImage? {
        if let backgroundColorNormal = backgroundColorNormal {
            return UIImage.roundedImage(withColor: backgroundColorNormal, andCornerRadius: cornerRadius)
        }
        return nil
    }
    
    private var backgroundImageHighlighted: UIImage? {
        if let backgroundColorHighlighted = backgroundColorHighlighted ?? backgroundColorNormal {
            return UIImage.roundedImage(withColor: backgroundColorHighlighted, andCornerRadius: cornerRadius)
        }
        return nil
    }
    
    private var backgroundImageSelected: UIImage? {
        if let backgroundColorSelected = backgroundColorSelected ?? backgroundColorNormal {
            return UIImage.roundedImage(withColor: backgroundColorSelected, andCornerRadius: cornerRadius)
        }
        return nil
    }

}
