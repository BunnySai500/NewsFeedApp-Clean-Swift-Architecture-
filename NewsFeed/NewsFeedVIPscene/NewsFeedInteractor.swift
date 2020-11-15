 

import UIKit

protocol NewsFeedBusinessLogic
{
 func initializeWorkers()
 func resetLanguageTitle(withTitle title: String)
 func getLanguageTitle() -> String
}

class NewsFeedInteractor: NewsFeedBusinessLogic
{
    
    
  var presenter: NewsFeedPresentationLogic?
  var loc_Worker: NewsFeedLocalizationWorker?
  
  // MARK: Do something
  func initializeWorkers()
  {
  loc_Worker = NewsFeedLocalizationWorker()
  }
    
  func getLanguageTitle() -> String {
  guard let l_worker = loc_Worker else {return ""}
  return l_worker.languageTitle
  }
  
  func resetLanguageTitle(withTitle title: String)
  {
  guard let l_worker = loc_Worker else {return}
  l_worker.selectedLanguage = title
  l_worker.resetLanguageTitle()
  presenter?.setLanguage()
  }
}
