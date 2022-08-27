//
//  TweetService.swift
//  TweetWithinAppExample
//
//  Created by Hoye Lam on 27/08/2022.
//

import Foundation
import UIKit

protocol TweetServiceProviding {
    func tweet(text: String)
}

final class TweetService: TweetServiceProviding {
    func tweet(text: String) {
        // 1. Build Tweet String
        guard let tweet = text
            .addingPercentEncoding(
                withAllowedCharacters: .urlQueryAllowed
            ) else {
            return
        }
        
        // 2. Build URL
        guard let appUrl = URL(string: "twitter://post?message=\(tweet)") else {
            return
        }
        
  
        let application = UIApplication.shared
        
        // 3a. Open the Twitter app if possible
        if application.canOpenURL(appUrl) {
            application.open(appUrl)
        } else {
            // 3b. Open Twitter within web browser
            guard let webUrl = URL(string: "https://twitter.com/intent/tweet?text=\(tweet)") else {
                return
            }
            
            application.open(webUrl)
        }
    }
}


