 

import Foundation
import UIKit
protocol ConfigurableCell {
    func configureCell(withItem item: NewsFeed.NewsFeedItem)
}

class NewsItemCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var newsArtileImgView: CustomCacheImageView!
    
    @IBOutlet weak var titleTxtLabel: UILabel!
    
    @IBOutlet weak var titleValueLbl: UILabel!
    @IBOutlet weak var authorTxtLbl: UILabel!
    
    @IBOutlet weak var authorValueLbl: UILabel!
  
    @IBOutlet weak var descriptionTxtLbl: UILabel!
    
    @IBOutlet weak var descriptionValueLbl: UILabel!
    
    static var reuseId = "NewsItemCellReuseid"
    var newsItem: NewsFeed.NewsFeedItem?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.authorValueLbl.isHidden = true
        titleValueLbl.numberOfLines = 3
        descriptionValueLbl.numberOfLines = 10
    }
    func configureCell(withItem item: NewsFeed.NewsFeedItem) {
   
    self.newsItem = item
        self.titleTxtLabel.text = "Title".localizedString()
        self.authorTxtLbl.text = "Date".localizedString()
        self.descriptionTxtLbl.text = "Description".localizedString()
    guard let newItem = newsItem else {return}
    self.titleValueLbl.text = newItem.title
    if let author = newItem.date, author != ""
    {
    self.authorValueLbl.text = author.toDate()
    self.authorValueLbl.isHidden = false
    }
    self.descriptionValueLbl.text = newItem.description
    if let link = newItem.imageLink
    {
    self.newsArtileImgView.loadImage(fromLink: link)
    }
    }
}
