//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Jin Zhang on 9/13/25.
//

import UIKit

class NewsViewController: UIViewController {
    
    let newsViewModel = NewsViewModel(networkManager: NetworkManager())
    
    
    @IBOutlet weak var myTableView: UITableView!

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        Task {
            await getNewsData()
        }
    }
    func getNewsData() async{
        do {
            try await newsViewModel.getNewsList()
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
            
        } catch {
            print( error.localizedDescription)
        }
    }
}



extension NewsViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return newsViewModel.newsList.count
        } else {
            return newsViewModel.newsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionContainerTableViewCell", for: indexPath) as! CollectionContainerTableViewCell
            
            
            cell.articles = newsViewModel.newsList
            return cell
            
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            let article = newsViewModel.newsList[indexPath.row]
            cell.configure(with: article)
            return cell
        }
        
    }
    
    
}

