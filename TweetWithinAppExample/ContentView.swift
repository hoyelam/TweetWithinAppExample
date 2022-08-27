//
//  ContentView.swift
//  TweetWithinAppExample
//
//  Created by Hoye Lam on 27/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel(
        tweetService: TweetService()
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("My tweet drafter")
                .font(.title)
            
            TextField(
                "Type your amazing non-toxic tweet",
                text: $viewModel.text
            )
            .padding()
            .background(Color.gray.opacity(0.4))
            .cornerRadius(16)
            
            Button {
                viewModel.onTapTweet()
            } label: {
                Text("Tweet")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
