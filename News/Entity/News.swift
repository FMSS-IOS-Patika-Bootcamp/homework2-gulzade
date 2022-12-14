//
//  News.swift
//  News
//
//  Created by Gülzade Karataş on 18.09.2022.
//

import Foundation

struct News {
  
    var newsTitle:String?
    var newsImage:String?
    var newsDescription:String?
    var newsCategory:String?
    var newsLink:String?
   
    
    init(newsTitle: String, newsImage: String, newsDescription: String, newsCategory: String, newsLink:String) {
         self.newsTitle = newsTitle
         self.newsImage = newsImage
         self.newsDescription = newsDescription
         self.newsCategory = newsCategory
         self.newsLink = newsLink
     }
}
