 

import UIKit

protocol NewsFeedPresentationLogic
{
   func setLanguage()
}

class NewsFeedPresenter: NewsFeedPresentationLogic
{
 
    
  weak var viewController: NewsFeedDisplayLogic?
  
  // MARK: Do something
  func setLanguage() {
  viewController?.setLanguage()
  }
  
   
}
