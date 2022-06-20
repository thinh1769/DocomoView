//
//  SmallCell.swift
//  DocomoView
//
//  Created by Thịnh on 03/06/2022.
//

import UIKit

class SmallCell: UICollectionViewCell {

    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var cellSmallData: CellItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpSmallCell(color: UIColor) {
        sectionLabel.text = "id : \(cellSmallData!.id)"
        cellLabel.text = "name : \(cellSmallData!.name)"
        self.containerView.backgroundColor = color
    }
}
