//
//  CollapseCell.swift
//  DocomoView
//
//  Created by Nguyễn Thịnh on 09/06/2022.
//

import UIKit

class CollapseCell: UICollectionViewCell {

    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    
    var cellCollapseData : CellItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setUpCollapseCell() {
        sectionLabel.text = "id : \(cellCollapseData?.id ?? 0)"
        cellLabel.text = "name : \(cellCollapseData?.name ?? "")"
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        sectionLabel.text = nil
        cellLabel.text = nil
    }
}
