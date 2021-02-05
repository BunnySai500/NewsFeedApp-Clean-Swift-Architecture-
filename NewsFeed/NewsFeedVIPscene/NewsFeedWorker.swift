 

import UIKit

class NewsFeedServiceWorker: NSObject
{
    var totalItems: Int = 0
    var nextPage: Int = 1
    var chunk: Int = 10
    private lazy var apiService = APIService()
    var currentlyLoading: Bool = false
    func loadMoreFeed(completion: @escaping ([NewsFeed.NewsFeedItem]) -> Void) {
    guard let feedLink = URL(string: APIEndPoints.returnFeedLink(forpageSize: chunk, andId: nextPage)) else {return}
    currentlyLoading = true
    apiService.getDataFromEndpoint(urlString: feedLink) { (error, data) in
    if let err = error {print(err)}
        if let feedData = data
    {
        JsonParser.getJsonDataObjectfromResponse(withData: feedData, type: NewsFeed.NewsFeedList.self) { [weak self] (err, feedclass) in
        guard let feeddata = feedclass, let articles = feeddata.articles, let count = feeddata.itemsCount else{return}
        guard let strongSelf = self else{return}
        strongSelf.nextPage += 1
        strongSelf.totalItems = count
        strongSelf.currentlyLoading = false
        completion(articles)
        }
    }
    }
    }
}


class NewsFeedLocalizationWorker {
    var selectedLanguage: String = "English"
    var languageTitle: String = "French"
    func resetLanguageTitle()
    {
    languageTitle = selectedLanguage == "English" ? "French" : "English"
    let key = selectedLanguage == "English" ? "en" : "fr"
    UserDefaults.standard.set(key, forKey: "language")
    }
}
