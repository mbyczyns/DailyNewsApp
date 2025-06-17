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
    static let sampleSnippet = News_Snippet(title: "przykładowy tytuuul który jest bardzo długi :) ", keywords: ["legia","lech","ekstraklasa"], main_image_url: "https://static01.nyt.com/images/2015/10/10/us/10trump2/10trump2-watch308.jpg", web_url: "https://www.nytimes.com/2015/10/10/us/politics/donald-trump-presidential-race.html", print_headline: "ale nieładny tytuł :( musze tu dodac troche wiecej tekstu, zeby zobaczyc jak bedzie sie miescic", pub_date: "2010-10-08")
    static let sampleSnippet2 = News_Snippet(title: "polska mistrzem polski w hokeju na trawie", keywords: ["ford","mercedes","bmw", "motoryzacja"], main_image_url: "https://static01.nyt.com/images/2015/10/10/us/10trump2/10trump2-watch308.jpg", web_url: "https://www.nytimes.com/2015/10/10/us/politics/donald-trump-presidential-race.html", print_headline: "ale nieładny tytuł :(", pub_date: "2010-10-08")
    static let sampleSnippet3 = News_Snippet(title: "najnowsze sondaże wskazują że wybory sie nie odbędą", keywords: ["tusk","polityka"], main_image_url: "https://static01.nyt.com/images/2015/10/10/us/10trump2/10trump2-watch308.jpg", web_url: "https://www.nytimes.com/2015/10/10/us/politics/donald-trump-presidential-race.html", print_headline: "ale nieładny tytuł :(", pub_date: "2010-10-08")
    static let sampleSnippet4 = News_Snippet(title: "kolejny tytul na ktory zbrakło mi już pomysłow", keywords: ["chajzer","kebab","telewizja"], main_image_url: "https://static01.nyt.com/images/2015/10/10/us/10trump2/10trump2-watch308.jpg", web_url: "https://www.nytimes.com/2015/10/10/us/politics/donald-trump-presidential-race.html", print_headline: "ale nieładny tytuł :(", pub_date: "2010-10-08")
    
    static let snippets = [sampleSnippet, sampleSnippet2, sampleSnippet3, sampleSnippet4]
    
    static let sampleText = """
    The Mario Kart games are toys, things to pick up and play, to boop and to beep, before putting them back down again. The karts and drivers you can select are collectibles to rotate around and admire, not embody. They’re like video game versions of Parcheesi. They don’t come bearing rich characters, plots or motivations, all useful tools when it comes to creating something that can memorably exist on its own as a piece of art.

    When Mario Kart 8 came out for the Wii U in 2014, the most active discourse about it online focused on Luigi. More specifically, the evil way he seems to smirk at other racers while caught on the replay camera that rolls after a race. We couldn’t get enough of the anodyne plumber shooting murderous looks at his competitors. But Luigi wasn’t designed to be a giant jerk. His demeanor was an accident of his default facial expression paired with players’ desire for meaning and humor in a game without much consideration for either.

    Since the release of Mario Kart World, I’ve already seen popular social media posts with a picture of a smiling Toad driving a police car, instigating questions of whether anti-cop slogans apply to this gormless talking mushroom. All of these memes work as a kind of fan fiction for Mario Kart, adding a layer of narrative.
"""
}
