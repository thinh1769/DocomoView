//
//  ViewController.swift
//  DocomoView
//
//  Created by Thịnh on 03/06/2022.
//

import UIKit

struct CellItem {
    var id: Int = 0
    var name: String = ""
}
struct CellCollapse {
    var id: Int = 0
    var name: String = ""
    var isCollapsed: Bool = false
    var collapseList: [CellItem]?
}
struct CellRanking {
    var rank: Int = 0
    var imageURL: String = ""
    var detail: String = ""
}
class ViewController: UIViewController {

    @IBOutlet var homeCollectionView: UICollectionView!
    
    enum SectionInfo: Int, CaseIterable {
        case firstSection
        case secondSection
        case thirdSection
        case fourthSection
        case fifthSection
        case sixthSection
        case seventhSection
    }
    let collapseCell = String(describing: CollapseCell.self)
    let regularCell = String(describing: RegularCell.self)
    let smallCell = String(describing: SmallCell.self)
    let videoCell = String(describing: VideoCell.self)
    let rankingCollectionCell = String(describing: RankingCollectionCell.self)
    let horizontalCollectionViewCell = String(describing: HorizontalCollectionViewCell.self)
    let horizontalCollectionCell = String(describing: HorizontalCollectionCell.self)
    var currentCell : Int = 0

    var dataSection1: [CellItem] = [
        CellItem(id: 1, name: "One"),
        CellItem(id: 2, name: "Two"),
        CellItem(id: 3, name: "Three"),
        CellItem(id: 4, name: "Four"),
        CellItem(id: 5, name: "Five"),
        CellItem(id: 6, name: "Six"),
        CellItem(id: 7, name: "Seven")
        ]
    var dataSection2Collection: [CellItem] = [
        CellItem(id: 1, name: "One"),
        CellItem(id: 2, name: "Two"),
        CellItem(id: 3, name: "Three"),
        CellItem(id: 4, name: "Four"),
        CellItem(id: 5, name: "Five")
        ]
   
    
    var dataSection2: [CellItem] = [
        CellItem(id: 1, name: "One"),
        CellItem(id: 2, name: "Two"),
        CellItem(id: 3, name: "Three"),
        CellItem(id: 4, name: "Four"),
        CellItem(id: 5, name: "Five"),
        CellItem(id: 6, name: "Six"),
        CellItem(id: 7, name: "Seven")
        ]
    
    var dataCollapse: [CellCollapse] = [
        CellCollapse(id: 1, name: "Mot", isCollapsed: false, collapseList: nil),
        CellCollapse(id: 2, name: "Hai", isCollapsed: false, collapseList: nil),
        CellCollapse(id: 3, name: "Ba", isCollapsed: false, collapseList: nil),
        CellCollapse(id: 4, name: "Bon", isCollapsed: false, collapseList: nil),
        CellCollapse(id: 5, name: "Nam", isCollapsed: false, collapseList: nil),
    ]
    var cellRankingData : [CellRanking] = [
            CellRanking(rank: 1, imageURL: "first", detail: "first"),
            CellRanking(rank: 2, imageURL: "second", detail: "second"),
            CellRanking(rank: 3, imageURL: "third", detail: "third"),
            CellRanking(rank: 4, imageURL: "fourth", detail: "fourth"),
            CellRanking(rank: 5, imageURL: "fifth", detail: "fifth")
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHomeCollectionView()
    }
    
    func createRandomDataCollapse() -> [CellItem] {
        var data = [CellItem]()
        for i in 0...Int.random(in: 0..<4) {
            let dataCell = CellItem(id: i+1, name: "number \(i+1)")
            data.append(dataCell)
        }
        return data
    }
}

extension ViewController {
    func setUpHomeCollectionView() {
        
        homeCollectionView.register(UINib(nibName: self.regularCell, bundle: nil), forCellWithReuseIdentifier: self.regularCell)
        homeCollectionView.register(UINib(nibName: self.smallCell, bundle: nil), forCellWithReuseIdentifier: self.smallCell)
        homeCollectionView.register(UINib(nibName: self.horizontalCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: self.horizontalCollectionViewCell)
        homeCollectionView.register(UINib(nibName: self.horizontalCollectionCell, bundle: nil), forCellWithReuseIdentifier: self.horizontalCollectionCell)
        homeCollectionView.register(UINib(nibName: self.collapseCell, bundle: nil), forCellWithReuseIdentifier: self.collapseCell)
        homeCollectionView.register(UINib(nibName: self.videoCell, bundle: nil), forCellWithReuseIdentifier: self.videoCell)
        homeCollectionView.register(UINib(nibName: self.rankingCollectionCell, bundle: nil), forCellWithReuseIdentifier: self.rankingCollectionCell)
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
  
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionInfo = SectionInfo(rawValue: indexPath.section)
        
        switch sectionInfo {
        case .firstSection:
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.regularCell, for: indexPath) as! RegularCell
                cell.cellRegular = dataSection1[indexPath.row]
                cell.setUpRegularCell()
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.smallCell, for: indexPath) as! SmallCell
                cell.cellSmallData = dataSection1[indexPath.row]
                cell.setUpSmallCell(color: .yellow)
                return cell
            }
        case .secondSection:
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.horizontalCollectionCell, for: indexPath) as! HorizontalCollectionCell
                cell.cellCollection = dataSection1
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.smallCell, for: indexPath) as! SmallCell
                cell.cellSmallData = dataSection1[indexPath.row]
                cell.setUpSmallCell(color: .systemPink)
                return cell
            }
        case .thirdSection:
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.horizontalCollectionViewCell, for: indexPath) as! HorizontalCollectionViewCell
                cell.cellCollection = dataCollapse
                cell.delegate = self
                return cell
            }
            else if dataCollapse[currentCell].isCollapsed {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collapseCell, for: indexPath) as! CollapseCell
                cell.cellCollapseData = dataCollapse[currentCell].collapseList?[indexPath.row-1]
                cell.setUpCollapseCell()
                return cell
            }
            else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collapseCell, for: indexPath) as! CollapseCell
                return cell
            }
        case .fourthSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.smallCell, for: indexPath) as! SmallCell
            cell.cellSmallData = dataSection1[indexPath.row]
            cell.setUpSmallCell(color: .green)
            return cell
            
        case .fifthSection:
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.videoCell, for: indexPath) as! VideoCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.smallCell, for: indexPath) as! SmallCell
                cell.cellSmallData = dataSection1[indexPath.row]
                cell.setUpSmallCell(color: .brown)
                return cell
            }
        case .sixthSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.rankingCollectionCell, for: indexPath) as! RankingCollectionCell
            cell.cellRankingData = cellRankingData
            return cell
            
        case .seventhSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.smallCell, for: indexPath) as! SmallCell
            cell.cellSmallData = dataSection1[indexPath.row]
            cell.setUpSmallCell(color: .orange)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = SectionInfo(rawValue: section)
        switch sectionInfo {
        case .firstSection:
            return dataSection1.count
        case .secondSection:
            return dataSection2.count
        case .thirdSection:
            if !dataCollapse[currentCell].isCollapsed {
                return 1
            } else {
                return (dataCollapse[currentCell].collapseList?.count)! + 1
            }
        case .fourthSection:
            return dataSection1.count - 1
        case .fifthSection:
            return dataSection1.count
        case .sixthSection:
            return 1
        case .seventhSection:
            return dataSection1.count - 1
        default:
            return 0
        }
    }
     
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionInfo.allCases.count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInfo = SectionInfo(rawValue: indexPath.section)
        switch sectionInfo {
        case .firstSection:
            if indexPath.row == 0 {
                return CGSize(width: collectionView.bounds.width, height: 200)
            } else {
                return CGSize(width: (collectionView.bounds.width / 2) - 12, height: (collectionView.bounds.width / 2) - 12)
            }
        case .secondSection:
            if indexPath.row == 0 {
                return CGSize(width: collectionView.bounds.width, height: 200)
            } else {
                return CGSize(width: (collectionView.bounds.width / 2) - 12, height: (collectionView.bounds.width / 2) - 12)
            }
        case .thirdSection:
            if indexPath.row == 0 {
                return CGSize(width: collectionView.bounds.width, height: 200)
            } else {
                return CGSize(width: collectionView.bounds.width - 12, height: 80)
            }
        case .fourthSection:
            return CGSize(width: (collectionView.bounds.width / 2) - 12, height: (collectionView.bounds.width / 2) - 12)
            
        case .fifthSection:
            if indexPath.row == 0 {
                return CGSize(width: collectionView.bounds.width, height: 200)
            } else {
                return CGSize(width: (collectionView.bounds.width / 2) - 12, height: (collectionView.bounds.width / 2) - 12)
            }
            
        case .sixthSection:
            return CGSize(width: (collectionView.bounds.width)-5, height: collectionView.bounds.height*3/5)
            
        case .seventhSection:
            return CGSize(width: (collectionView.bounds.width / 2) - 12, height: (collectionView.bounds.width / 2) - 12)
            
        default:
            return .zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0 // top
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12.0 // left
    }
    
}

extension ViewController: HorizontalCollectionViewCellDelegate {
    func checkCollapse(cell: HorizontalCollectionViewCell, currentRow: Int) {
    /*
     buoc 1: lay indexpath cua HorizontalCollectionViewCell
     buoc 2: tao data random [cellitem]
     buoc 3: cap nhat [cellitem] vao collapseList va property isCollapsed trong dataCollapse theo indexPath
     buoc 4: reload data
     **/
        //buoc 1
        currentCell = currentRow
        
        //buoc 2
        
        //buoc 3
        dataCollapse[currentRow].collapseList = createRandomDataCollapse()
        dataCollapse[currentRow].isCollapsed = true
        
        // buoc 4
        self.homeCollectionView.reloadData()
    }
}
