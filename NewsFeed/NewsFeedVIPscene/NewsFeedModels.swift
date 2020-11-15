
import UIKit

enum NewsFeed
{
  // MARK: Use cases
    static var title = "NewsFeed"
    struct NewsFeedItem: Decodable {
        var id = UUID().uuidString
        var title: String?
        var author: String?
        var imageLink: String?
        var description: String?
        
        enum CodingKeys: String, CodingKey {
            case title, author, description
            case imageLink = "urlToImage"
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
