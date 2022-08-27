//
//  ContentViewModel.swift
//  TweetWithinAppExample
//
//  Created by Hoye Lam on 27/08/2022.
//

import Foundation

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var text: String = ""
    
    let tweetService: TweetServiceProviding
    
    init(tweetService: TweetServiceProviding) {
        self.tweetService = tweetService
    }
    
    func onTapTweet() {
        self.tweetService.tweet(text: self.text)
    }
}
