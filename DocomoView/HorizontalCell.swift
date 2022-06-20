//
//  HorizontalCell.swift
//  DocomoView
//
//  Created by Thịnh on 03/06/2022.
//

import UIKit

class HorizontalCell: UICollectionViewCell {

    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    
    var collectionData : CellItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpHorizontalCell(color: UIColor) {
        sectionLabel.text = "id : \(collectionData?.id ?? 0)"
        cellLabel.text = "name : \(collectionData?.name ?? "")"
    }
}
