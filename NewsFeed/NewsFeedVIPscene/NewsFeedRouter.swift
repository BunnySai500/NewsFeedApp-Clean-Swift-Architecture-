 

import UIKit

@objc protocol NewsFeedRoutingLogic
{
   
}

protocol NewsFeedDataPassing
{
func presentNews(ofItem item: NewsFeed.NewsFeedItem)
}

class NewsFeedRouter: NSObject, NewsFeedRoutingLogic, NewsFeedDataPassing
{
  weak var viewController: NewsFeedViewController?
   
    func presentNews(ofItem item: NewsFeed.NewsFeedItem)
  {
    let vie = NewsRendererVC()
    guard let link = item.newsLink, let url = URL(string: link) else {return}
    let request = URLRequest(url: url)
    vie.request = request
    viewController?.navigationController?.pushViewController(vie, animated: true)
  }
  
   
}
