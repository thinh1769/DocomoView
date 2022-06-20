//
//  HorizontalCollectionCell.swift
//  DocomoView
//
//  Created by Thịnh on 06/06/2022.
//

import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var horizontalCollection: UICollectionView!
    
    let horizontalCell = String(describing: HorizontalCell.self)
    var cellCollection : [CellItem]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpHorizontalCollectionView()
    }
}


extension HorizontalCollectionCell {
    func setUpHorizontalCollectionView() {
        horizontalCollection.delegate = self
        horizontalCollection.dataSource = self
        horizontalCollection.register(UINib(nibName: self.horizontalCell, bundle: nil), forCellWithReuseIdentifier: self.horizontalCell)
        
    }
}

extension HorizontalCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.horizontalCell, for: indexPath) as! HorizontalCell
        cell.collectionData = cellCollection![indexPath.row]
        cell.setUpHorizontalCell(color: .gray)
        return cell
    }
}

extension HorizontalCollectionCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
