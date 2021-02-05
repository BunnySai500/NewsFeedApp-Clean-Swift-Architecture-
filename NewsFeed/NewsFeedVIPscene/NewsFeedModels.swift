
import UIKit

enum NewsFeed
{
  // MARK: Use cases
    static var title = "NewsFeed"
    struct NewsFeedItem: Decodable {
        var id = UUID().uuidString
        var title: String?
        var date: String?
        var imageLink: String?
        var description: String?
        var newsLink: String?
        
        enum CodingKeys: String, CodingKey {
            case title, description
            case imageLink = "urlToImage"
            case date = "publishedAt"
            case newsLink = "url"
        }
    }
    struct NewsFeedList: Decodable {
        var itemsCount: Int?
        var articles: [NewsFeedItem]?
        enum CodingKeys: String, CodingKey {
            case articles
            case itemsCount = "totalResults"
        }
    }
}
