 

import UIKit

protocol NewsFeedDisplayLogic: class
{
  func setLanguage()
}

class NewsFeedViewController: UITableViewController, NewsFeedDisplayLogic
{
  var interactor: NewsFeedBusinessLogic?
  var router: (NSObjectProtocol & NewsFeedRoutingLogic & NewsFeedDataPassing)?
  var newsFeedDataSource: NewsFeedDataSource?

   
   
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = NewsFeedInteractor()
    let presenter = NewsFeedPresenter()
    let router = NewsFeedRouter()
    viewController.interactor = interactor
    viewController.router = router
    presenter.viewController = viewController
    interactor.presenter = presenter
    router.viewController = viewController
     let dataSource = NewsFeedDataSource(self.tableView)
    self.newsFeedDataSource = dataSource
    viewController.tableView.delegate = dataSource
    viewController.tableView.dataSource = dataSource
    self.title = NewsFeed.title
  }
  
  // MARK: Routing
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    setup()
    initializeNewsFeed()
    setNavigationItems()
  }
  
  // MARK: Do something
    
  func setNavigationItems()
  {
  //guard let vm = viewModel else {return}
    let button = UIBarButtonItem(title: interactor?.getLanguageTitle(), style: .plain, target: self, action: #selector(changeLanguage))
  
  navigationItem.rightBarButtonItem = button
  }
  @objc func changeLanguage()
  {
    
    guard let rightBtn = navigationItem.rightBarButtonItem, let title = rightBtn.title else{return}
  
  interactor?.resetLanguageTitle(withTitle: title)
  }
  func setLanguage()
  {
  navigationItem.rightBarButtonItem?.title = interactor?.getLanguageTitle()
  tableView.reloadData()
  }
  func initializeNewsFeed()
  {
    interactor?.initializeWorkers()
  }
}
