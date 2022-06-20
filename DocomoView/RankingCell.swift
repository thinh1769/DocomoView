//
//  RankingCell.swift
//  DocomoView
//
//  Created by Nguyễn Thịnh on 10/06/2022.
//

import UIKit

class RankingCell: UICollectionViewCell {

    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var rankingImage: UIImageView!
    @IBOutlet weak var rankingDetail: UILabel!
    
    var rankingCell : CellRanking?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpRankingCell() {
        rankingLabel.text = "\(rankingCell!.rank)"
        rankingDetail.text = "\(rankingCell!.detail)"
    }
}
