//
//  RegularCell.swift
//  DocomoView
//
//  Created by Thịnh on 03/06/2022.
//

import UIKit

class RegularCell: UICollectionViewCell {

    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    
    var cellRegular: CellItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpRegularCell() {
        sectionLabel.text = "id : \(cellRegular!.id)"
        cellLabel.text = "name : \(cellRegular!.name)"
    }
}
