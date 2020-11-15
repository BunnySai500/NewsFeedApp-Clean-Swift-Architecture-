//
//  Constants.swift
//  GalleryCollection
//
//  Created by Bunny Bhargav on 21/10/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation
import UIKit



struct APIEndPoints {
    static let newsFeedBaseApi = "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=a8fabd9ff4234c82aad08eaaa4ea17a0&"
    static func returnFeedLink(forpageSize size: Int, andId id: Int) -> String
    {
    return "\(newsFeedBaseApi)pageSize=\(size)&page=\(id)"
    }
}


let imageCache = NSCache<NSString, UIImage>()
