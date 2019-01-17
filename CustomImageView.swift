//
//  CustomImageView.swift
//  PentagonSample
//
//  Created by Preeteesh Remalli on 18/01/19.
//  Copyright © 2019 Preeteesh Remalli. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {

    var bezierPath = UIBezierPath()
    
    override func setNeedsLayout() {
        bezierPath.reversing()
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
        self.layer.masksToBounds = true
    }
}
