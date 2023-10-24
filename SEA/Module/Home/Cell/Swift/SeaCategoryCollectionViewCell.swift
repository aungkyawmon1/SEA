//
//  SeaCategoryCollectionViewCell.swift
//  SEA
//
//  Created by solinx on 24/10/2023.
//

import UIKit

class SeaCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(imageName: String, name: String) {
        lblName.text = name
        ivImage.image = UIImage(named: imageName)
    }

}
