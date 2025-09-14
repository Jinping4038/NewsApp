//
//  NewsCollectionViewCell.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
 
    
    @IBOutlet weak var collectionViewImage: UIImageView!
    
    
    @IBOutlet weak var collectionViewTitle: UILabel!
    
    @IBOutlet weak var collectionViewContant: UILabel!
    
    func configure(with news: Article){
        collectionViewTitle.text = news.title
        collectionViewContant.text = news.content
        
        if let imageUrl = URL(string: news.urlToImage ?? "" ){
        
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data:data){
                    DispatchQueue.main.async {
                        self.collectionViewImage.image = image
                    }
                }
            }
        }
        
    }
}
