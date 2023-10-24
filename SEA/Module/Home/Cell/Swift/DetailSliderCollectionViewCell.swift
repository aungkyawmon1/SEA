//
//  DetailSliderCollectionViewCell.swift
//  SEA
//
//  Created by solinx on 24/10/2023.
//

import UIKit

class DetailSliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivSlider: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ivSlider.clipsToBounds = true
        ivSlider.layer.cornerRadius = 20
        ivSlider.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

}
