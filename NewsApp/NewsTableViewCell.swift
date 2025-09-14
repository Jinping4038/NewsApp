//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var tableViewImage: UIImageView!
    
    @IBOutlet weak var tableViewTitle: UILabel!
    
    @IBOutlet weak var tableViewContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with news: Article){
        tableViewTitle.text = news.title
        tableViewContent.text = news.content
        
        if let imageUrl = URL(string: news.urlToImage ?? "" ){
        
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data:data){
                    DispatchQueue.main.async {
                        self.tableViewImage.image = image
                    }
                }
            }
        }
        
    }

}
