//
//  CALayer+Rounded.swift
//  ProtonomeRoundedViews
//
//  Created by Daniel Clelland on 7/05/16.
//  Copyright © 2016 Daniel Clelland. All rights reserved.
//

import UIKit

// MARK: - Rounded layer contents

public extension CALayer {

    public func setRoundedContents(withColor color: UIColor, andCornerRadius: CGFloat) {
        let image = UIImage.roundedImage(withColor: color, andCornerRadius: cornerRadius)
        
        let x = image.capInsets.left / image.size.width
        let y = image.capInsets.top / image.size.height
        let width = (image.size.width - image.capInsets.right - image.capInsets.left) / image.size.width
        let height = (image.size.height - image.capInsets.bottom - image.capInsets.top) / image.size.height
        
        contents = image.CGImage
        contentsCenter = CGRect(x: x, y: y, width: width, height: height)
        contentsScale = image.scale
        contentsGravity = kCAGravityResize
    }

}
