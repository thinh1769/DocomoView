//
//  CollectionCellButton.swift
//  DocomoView
//
//  Created by Nguyễn Thịnh on 14/06/2022.
//

import UIKit

class CollectionCellButton: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    var cellData : CellCollapse? {
        didSet {
            setUpCollectionCellButton()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setUpCollectionCellButton() {
        guard let cellData = self.cellData else { return }
        idLabel.text = "id : \(cellData.id)"
        nameLabel.text = "name : \(cellData.name)"
    }
}
