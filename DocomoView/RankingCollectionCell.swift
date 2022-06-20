//
//  RankingCollectionCell.swift
//  DocomoView
//
//  Created by Nguyễn Thịnh on 10/06/2022.
//

import UIKit

class RankingCollectionCell: UICollectionViewCell {

    @IBOutlet weak var rankingCollection: UICollectionView!
    
    let rankingCell = String(describing: RankingCell.self)
    var cellRankingData : [CellRanking]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpRankingCollectionView()
    }

}

extension RankingCollectionCell {
    func setUpRankingCollectionView() {
        rankingCollection.register(UINib(nibName: self.rankingCell, bundle: nil), forCellWithReuseIdentifier: self.rankingCell)
        rankingCollection.delegate = self
        rankingCollection.dataSource = self
    }
}

extension RankingCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rankingCell, for: indexPath) as! RankingCell
        cell.rankingCell = cellRankingData![indexPath.row]
        cell.setUpRankingCell()
        return cell
    }
}

extension RankingCollectionCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
}
