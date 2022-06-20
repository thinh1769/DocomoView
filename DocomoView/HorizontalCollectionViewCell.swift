//
//  HorizontalCollectionViewCell.swift
//  DocomoView
//
//  Created by Thịnh on 03/06/2022.
//

import UIKit

protocol HorizontalCollectionViewCellDelegate: NSObject {
    func checkCollapse(cell: HorizontalCollectionViewCell, currentRow: Int)
}

class HorizontalCollectionViewCell: UICollectionViewCell {

    @IBOutlet var horizontalCollectionView: UICollectionView!
    
    weak var delegate : HorizontalCollectionViewCellDelegate?
    let collectionCellButton = String(describing: CollectionCellButton.self)
    var currentRow: Int = 0
    var cellCollection : [CellCollapse]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpHorizontalCollectionView()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        if self.currentRow > 0 {
            self.currentRow -= 1
        }
        self.horizontalCollectionView.scrollToItem(at: IndexPath(item: self.currentRow, section: 0), at: .centeredHorizontally, animated: true)
        self.delegate?.checkCollapse(cell: self, currentRow: currentRow)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if self.currentRow < (cellCollection?.count ?? 0) - 1 {
            self.currentRow += 1
        }
        self.horizontalCollectionView.scrollToItem(at: IndexPath(item: self.currentRow, section: 0), at: .centeredHorizontally, animated: true)
        self.delegate?.checkCollapse(cell: self, currentRow: currentRow)
    }
}

extension HorizontalCollectionViewCell {
    func setUpHorizontalCollectionView() {
       // horizontalCollectionView.register(UINib(nibName: self.collapseCell, bundle: nil), forCellWithReuseIdentifier: self.collapseCell)
        horizontalCollectionView.register(UINib(nibName: self.collectionCellButton, bundle: nil), forCellWithReuseIdentifier: self.collectionCellButton)
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
    }
}

extension HorizontalCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCollection?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellButton, for: indexPath) as! CollectionCellButton
        cell.cellData = cellCollection?[indexPath.row]
        return cell
    }
}

extension HorizontalCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
