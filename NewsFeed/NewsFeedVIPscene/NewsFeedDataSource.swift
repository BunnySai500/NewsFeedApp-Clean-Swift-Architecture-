 
import Foundation
import UIKit


class NewsFeedDataSource: NSObject {
    private var service_Worker: NewsFeedServiceWorker?
    private var table: UITableView?
    private var newsItems: [NewsFeed.NewsFeedItem] = []
    var selectionUpdate: (NewsFeed.NewsFeedItem) -> Void
    init(_ table : UITableView, selUp: @escaping (NewsFeed.NewsFeedItem) -> Void) {
        self.table = table
        self.selectionUpdate = selUp
        super.init()
        service_Worker = NewsFeedServiceWorker()
        registerCells()
        loadMoreFeed()
    }
    private func registerCells()
    {
    table?.register(UINib(nibName: "NewsItemCell", bundle: nil), forCellReuseIdentifier: NewsItemCell.reuseId)
    table?.rowHeight = UITableView.automaticDimension
    table?.estimatedRowHeight = 300
    }
    func loadMoreFeed()
    {
    guard let s_worker = service_Worker else{return}
    s_worker.loadMoreFeed { [weak self] articles in
    guard let strongSelf = self else{return}
    //print(articles)
    strongSelf.newsItems.append(contentsOf: articles)
    s_worker.totalItems = s_worker.totalItems > strongSelf.newsItems.count ? s_worker.totalItems : strongSelf.newsItems.count
    strongSelf.reloadData()
    }
    }
    private func reloadData()
    {
    DispatchQueue.main.async { [weak self] in
    guard let strongSelf = self else{return}
    strongSelf.table?.reloadData()
    }
    }
    
}
extension NewsFeedDataSource: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selIt = newsItems[indexPath.row]
    selectionUpdate(selIt)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsItemCell.reuseId, for: indexPath)
        let item = newsItems[indexPath.row]
        if let config_cell = cell as? ConfigurableCell
        {
        config_cell.configureCell(withItem: item)
        return config_cell as? UITableViewCell ?? UITableViewCell()
        }
    return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let contentOffSetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    if contentOffSetY > contentHeight - scrollView.frame.height
        {
        guard let s_worker = service_Worker else{return}
        if !s_worker.currentlyLoading, newsItems.count <= s_worker.totalItems
        {
        loadMoreFeed()
        }
        }
    }
}
