//
//  DetailUIViewController.swift
//  News
//
//  Created by Gülzade Karataş on 18.09.2022.
//

import UIKit

class DetailUIViewController: UIViewController {
    @IBOutlet weak var newsDetailImageView: UIImageView!
    
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = news?.newsCategory
        
        if let news = news {
            newsTitleLabel.text = news.newsTitle
            newsDescription.text = news.newsDescription
            newsDetailImageView.image = UIImage(named: news.newsImage!)
        }
    }
    
    
    @IBAction func showMoreDeatailsButton(_ sender: Any) {
       let webvc =  self.storyboard?.instantiateViewController(withIdentifier: "ShowMoreViewController") as!ShowMoreViewController
        if let link = news?.newsLink {
            webvc.newsLink = link
            present(webvc, animated: true)
        }
        
    }
    
    
}
