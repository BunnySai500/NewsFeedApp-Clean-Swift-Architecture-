 

import UIKit

@objc protocol NewsFeedRoutingLogic
{
   
}

protocol NewsFeedDataPassing
{
   
}

class NewsFeedRouter: NSObject, NewsFeedRoutingLogic, NewsFeedDataPassing
{
  weak var viewController: NewsFeedViewController?
   
  // MARK: Routing
  
   
}
