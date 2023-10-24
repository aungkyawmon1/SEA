//
//  CardView.swift
//  SEA
//
//  Created by solinx on 24/10/2023.
//

import UIKit


@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var borderWidth : CGFloat = 0
    @IBInspectable var borderColor : UIColor = .black
    @IBInspectable var isCircle : Bool = false
    
    // for CardView Gradiend layer
//    let gradient: CAGradientLayer = CAGradientLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        
        layer.cornerRadius = isCircle ? self.frame.size.height / 2 : cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: isCircle ? self.frame.size.height / 2 : cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
//        gradient.frame = self.bounds
        
        super.layoutSubviews()
    }
    

   
}

