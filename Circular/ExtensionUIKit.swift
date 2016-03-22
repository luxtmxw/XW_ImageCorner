//
//  ExtensionUIKit.swift
//  Circular
//
//  Created by luxtmxw on 16/3/22.
//  Copyright © 2016年 Bintao. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func xw_drawRectWithRoundCorner(radius radius: CGFloat, _sizetoFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: _sizetoFit)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.mainScreen().scale)
        CGContextAddPath(UIGraphicsGetCurrentContext(), UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: radius, height: radius)).CGPath)
        CGContextClip(UIGraphicsGetCurrentContext())
        self.drawInRect(rect)
        CGContextDrawPath(UIGraphicsGetCurrentContext(), .FillStroke)
        let outPut = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outPut
    }
}

extension UIImageView {
    
    func xw_addCorner(radius radius: CGFloat) {
        self.image = self.image?.xw_drawRectWithRoundCorner(radius: radius, _sizetoFit: self.bounds.size)
    }
}