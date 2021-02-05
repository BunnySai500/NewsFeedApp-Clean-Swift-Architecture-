 

import Foundation
import UIKit


class CustomCacheImageView: UIImageView {
    var urlString: String?
    
    func loadImage(fromLink link: String)
    {
    self.urlString = link
    guard let imageLink = URL(string: link) else {return}
    image = nil
        if let str = self.urlString, let cachedImage = imageCache.object(forKey: NSString(string: str))
        {
        self.image = cachedImage
        return
        }
    APIService().getDataFromEndpoint(urlString: imageLink) { (error, data) in
        if let err = error{
        print(err)
        return}
        if let imagedate = data, let galleryimage = UIImage(data: imagedate){
        DispatchQueue.main.async { [weak self] in
        guard let strongSelf = self else{return}
        if strongSelf.urlString == link
        {strongSelf.image = galleryimage}}
        imageCache.setObject(galleryimage, forKey: NSString(string: link))
        }}
    }
    
    
    
}
