//
//  CollectionContainerTableViewCell.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import UIKit

class CollectionContainerTableViewCell: UITableViewCell {
    
    var articles: [Article] = [] {
        didSet {
            myCollectionView.reloadData()
        }
    }

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CollectionContainerTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        
        let article = articles[indexPath.row]
        cell.configure(with: article)
    
        return cell
    }
}
