//
//  SeaCategoryTableViewCell.swift
//  SEA
//
//  Created by solinx on 24/10/2023.
//

import UIKit

class SeaCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewCategory: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    var itemWidth : CGFloat = 0
    var itemHeight : CGFloat = 0
    
    private let _itemsPerRow = 4
    private let _itemsPerColumn = 2
    private let _itemsPerPage = 4 * 2
    private var _virtualCount: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tableViewLeftRightPadding : CGFloat = 32
        
        itemWidth = (UIScreen.main.bounds.width - tableViewLeftRightPadding) / 4
        itemHeight = itemWidth
        
        collectionViewHeight.constant = (itemHeight * 2) + 5
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionViewCategory.registerForCells(cells: SeaCategoryCollectionViewCell.self)
        collectionViewCategory.dataSource = self
        collectionViewCategory.delegate = self
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension SeaCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeReuseCell(type: SeaCategoryCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: CGFloat(240))
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
