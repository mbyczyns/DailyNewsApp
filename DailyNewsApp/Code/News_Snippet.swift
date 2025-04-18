import Foundation


struct News_Snippet: Decodable {
    let title: String;
    let keywords: [String];
    let main_image_url: String;
    let web_url: String;
    let print_headline: String;
    let pub_date: String;
}

struct SnippetsResponse: Decodable {
    let request: [News_Snippet]
}


struct MockData {
    static let sampleSnippet = News_Snippet(title: "przykładowy tytuuul który jest bardzo długi :) ", keywords: ["kaczynski","tusk","polityka"], main_image_url: "https://static01.nyt.com/images/2015/10/10/us/10trump2/10trump2-watch308.jpg", web_url: "https://www.nytimes.com/2015/10/10/us/politics/donald-trump-presidential-race.html", print_headline: "ale nieładny tytuł :( musze tu dodac troche wiecej tekstu, zeby zobaczyc jak bedzie sie miescic", pub_date: "2010-10-08")
    static let sampleSnippet2 = News_Snippet(title: "polska mistrzem polski w hokeju na trawie", keywords: ["kaczynski","tusk","polityka"], main_image_url: "https://static01.nyt.com/images/2015/10/10/us/10trump2/10trump2-watch308.jpg", web_url: "https://www.nytimes.com/2015/10/10/us/politics/donald-trump-presidential-race.html", print_headline: "ale nieładny tytuł :(", pub_date: "2010-10-08")
    static let sampleSnippet3 = News_Snippet(title: "najnowsze sondaże wskazują że wybory sie nie odbędą", keywords: ["kaczynski","tusk","polityka"], main_image_url: "https://static01.nyt.com/images/2015/10/10/us/10trump2/10trump2-watch308.jpg", web_url: "https://www.nytimes.com/2015/10/10/us/politics/donald-trump-presidential-race.html", print_headline: "ale nieładny tytuł :(", pub_date: "2010-10-08")
    static let sampleSnippet4 = News_Snippet(title: "kolejny tytul na ktory zbrakło mi już pomysłow", keywords: ["kaczynski","tusk","polityka"], main_image_url: "https://static01.nyt.com/images/2015/10/10/us/10trump2/10trump2-watch308.jpg", web_url: "https://www.nytimes.com/2015/10/10/us/politics/donald-trump-presidential-race.html", print_headline: "ale nieładny tytuł :(", pub_date: "2010-10-08")
    
    static let snippets = [sampleSnippet, sampleSnippet2, sampleSnippet3, sampleSnippet4]
}
