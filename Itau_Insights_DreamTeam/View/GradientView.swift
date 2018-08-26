//
//  GradientView.swift
//  Itau_Insights_DreamTeam
//
//  Created by Vitor Santos on 26/08/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColor = UIColor(red: 0.14, green: 0.75, blue: 0.76, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor = UIColor(red: 0.67, green: 0.34, blue: 1, alpha: 1)  {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        
        let gradienteLayer = CAGradientLayer()
        
        gradienteLayer.locations = [0.01, 1]
        gradienteLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradienteLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradienteLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradienteLayer.frame = self.bounds
        gradienteLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -1, b: 1, c: -1, d: -0.32, tx: 1.5, ty: 0.16))
        gradienteLayer.bounds = self.layer.bounds.insetBy(dx: -0.5*self.layer.bounds.size.width, dy: -0.5*self.layer.bounds.size.height)
        
        self.layer.insertSublayer(gradienteLayer, at: 0)
    }
    
}
