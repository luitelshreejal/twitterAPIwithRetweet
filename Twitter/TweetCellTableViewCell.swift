//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Shreejal Luitel on 11/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var fabButton: UIButton!
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let toBeFavorited = !favorited
        
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: true)
            }, failure: { (error) in
               print("Favorite didn't succeed: \(error)")
                
            })
        } else {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: false)
            }, failure: { (error) in
                print("Unfavorite didn't succeed: \(error)")
            })
        }
        
    }
 

    @IBAction func retweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(isRetweeted: true)
    
        }, failure: { (error) in
            print("Error in retweeting: \(error)")

        })
         
    }
    
    
    func setRetweeted(  isRetweeted:Bool){
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setFavorite(  isFavorited: Bool){
        favorited = isFavorited
        if (favorited){
            fabButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            fabButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
