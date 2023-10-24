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
    
    weak var delegate: HomeDetailDelegate?
    
    let categories: [CategoryVO] = [
    
        CategoryVO(name: "Map", imageName: "Group 342"),
        CategoryVO(name: "Inhabitants", imageName: "Group 342-2"),
        CategoryVO(name: "Shows", imageName: "Group 341"),
        CategoryVO(name: "Shopping", imageName: "Group 275"),
        CategoryVO(name: "Dine", imageName: "Group 310"),
        CategoryVO(name: "Meet & Geet", imageName: "Layer 1"),
        CategoryVO(name: "Fish", imageName: "Group 342"),
    ]
    
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
        
        self._virtualCount = getCount()
    }
    
    private func getCount() -> Int {
        let count = 7
        let totalPages = Int(ceil(Double(count) / Double(_itemsPerPage)))
        return Int(totalPages) * _itemsPerPage
    }
    
    private func setupCollectionView() {
        collectionViewCategory.registerForCells(cells: [ SeaCategoryCollectionViewCell.self,
            EmptyViewCollectionViewCell.self])
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
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let index = _tryGetDataIndex(indexPath: indexPath) {
            let cell = collectionView.dequeReuseCell(type: SeaCategoryCollectionViewCell.self, indexPath: indexPath)
            let category = categories[index]
            cell.setupView(imageName: category.imageName, name: category.name)
            return cell
            
            
        }else {
            let cell = collectionView.dequeReuseCell(type: EmptyViewCollectionViewCell.self, indexPath: indexPath)
            return cell
            
        }
        
    }
    
    private func _tryGetDataIndex(indexPath: IndexPath)-> Int? {
          let index = indexPath.row;
          let page = index / _itemsPerPage
          let indexInPage = index - page * _itemsPerPage;
          let row = indexInPage % _itemsPerColumn;
          let column = indexInPage / _itemsPerColumn;
          
          let dataIndex = row * _itemsPerRow + column + page * _itemsPerPage
          if dataIndex >= 8{
              return nil
          }
          return dataIndex
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: itemHeight)
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigateToDetail()
    }
    
    
}
