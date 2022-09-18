//
//  ViewController.swift
//  News
//
//  Created by Gülzade Karataş on 18.09.2022.
//

import UIKit

class ViewController: UIViewController {
    var newsList = [News]()
    @IBOutlet weak var newsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "NEWS"
        let appearance = UINavigationBarAppearance()
       // appearance.backgroundColor = UIColor(named: "dolapColor")
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top:10, left: 10, bottom: 10, right: 10)
        design.minimumLineSpacing = 10
        design.minimumInteritemSpacing = 10
        let width = UIScreen.main.bounds.width
        let widthCell = ( width - 30) / 2
        design.itemSize = CGSize(width: widthCell, height: widthCell*1.7)
        newsCollectionView.collectionViewLayout = design
        
        
        newsList.append(News(newsTitle: "Queen's funeral plans: What will happen on the day",
                             newsImage: "queen",
                             newsDescription: "After",
                             newsCategory: "Politics"))
        
        
        newsList.append(News(newsTitle: "Artemis: Cornwall's Goonhilly to support Nasa Moon mission",
                             newsImage: "space",
                             newsDescription: "Goonhilly Earth Station ",
                             newsCategory: "Science"))
        
      newsList.append(News(newsTitle: "The mysterious people of the Caribbean",
                             newsImage: "Samana",
                             newsDescription: "A rare archaeological discovery on the Dominican Republic's secluded Samaná Peninsula could unlock the mystery behind the Caribbean's little-known pre-Arawak past.You wouldn't think of the overtrodden Dominican Republic as a cutting-edge archaeology destination. Yet hidden beneath the beach cabanas are likely clues to a pre-Columbian mystery that's been perplexing anthropologists for centuries: who actually discovered the Caribbean?",
                            newsCategory: "Travel"))
        
        newsList.append(News(newsTitle: "Explore the 2022-2023 Best National Universities",
                             newsImage: "education",
                             newsDescription: "Earning an undergraduate degree from a top college can open the door to many career opportunities. From public to private universities, the U.S. News best National Universities list includes a mix of research institutions that offer a diverse range of undergraduate, graduate and graduate programs. Find out which schools topped the 2022-2023 Best National Universities rankings and see key details about each, including costs using the latest data available to U.S. News. Due to ties in the rankings, more than 40 schools are included.",
                             newsCategory: "Education"))
        
        newsList.append(News(newsTitle: "Enid Blyton: The most comforting children’s books ever",
                             newsImage: "culture",
                             newsDescription: "Although her books evoke a particular time in Britain, Enid Blyton has found an unexpected following in India. On the 125th anniversary of the author's birth, Kamala Thiagarajan discovers what draws people to her work.On a rainy, windswept morning in August 2021, in the Western Indian city of Pune, Alisha Purandare (35), a former German language tutor and parenting blogger, witnessed a rather heart-melting sight. Her 74-year-old mother-in-law and her eight-year-old daughter were sitting shoulder-to-shoulder on a sofa, reading in companionable silence. They were immersed in a world of mystery books written by the British author Enid Blyton.",
                             newsCategory: "Culture"))
        
        newsList.append(News(newsTitle: "Despite a massive game from Dennis Schroder, Spain ousts Germany 96-91 from the EuroBasket",
                             newsImage: "sports",
                             newsDescription: "It would be one of his best games of the 2022 European Basketball Championship for his German National Team, but Dennis Schroder’s big game would not prove to be enough to get Germany past the Spanish National Team in EuroBasket knockout play on Friday, Schroder’s squad falling 96-91.",
                             newsCategory: "Sports"))
    }


}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let news = newsList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCollectionViewCell
       
        cell.newsCategoryLabel.text = news.newsCategory
        cell.newsImageView.image = UIImage(named: news.newsImage!)
        cell.newsImageView.layer.masksToBounds = true
        cell.newsImageView.layer.cornerRadius = 40
        cell.newsImageView.layer.borderColor =  UIColor.systemGray6.cgColor
        cell.newsImageView.layer.borderWidth = 2.5
        print("colll")
        cell.setupView()
        return cell
     
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let news = newsList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: news)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let news = sender as? News {
                let detailsVC = segue.destination as! DetailUIViewController
                detailsVC.news = news
            }
        }
    }
}
