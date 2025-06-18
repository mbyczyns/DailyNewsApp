import Foundation

struct User: Decodable{
    let Username: String;
    let WatchedArticlesAmount: Int;
    let ProfileImageUrl: String;
    let ReadingHistory: [News_Snippet];
    let LikedArticles: [News_Snippet];
}


let MockUser = User(Username: "tomek123", WatchedArticlesAmount: 145, ProfileImageUrl: "https://avatars.pfptown.com/349/cool-discord-pfp-924.png", ReadingHistory: MockData.snippets, LikedArticles: MockData.snippets)
