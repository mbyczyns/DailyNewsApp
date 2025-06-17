import SwiftUI

struct ReadArticleView: View {
    
    let article_snippet: News_Snippet;
    @State private var fullArticleText: String = "Ładowanie treści..."

    
    var body: some View {
        ScrollView{
            VStack{
                ArticleRemoteImage(urlString: article_snippet.main_image_url)
                    .aspectRatio(contentMode: .fit)
                Text(article_snippet.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(20)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Text(article_snippet.print_headline)
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding([.leading, .trailing, .bottom], 20)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Text(fullArticleText)
                    .padding(15)
                Spacer()
                Link(destination: URL(string: article_snippet.web_url)!) {
                    Text("Read more in NYTimes website ...")
                        .foregroundColor(.blue)
                        .underline()
                }
                Button(action: {
                    NetworkManager.likeArticle(with: article_snippet.web_url) { result in
                            DispatchQueue.main.async {
                                switch result {
                                case .success:
                                    print("dałeś lajka!")
                                case .failure:
                                    print("błąd: nie dałeś lajka :(")
                                }
                            }
                        }            }) {
                    Label("Like this Article", systemImage: "heart")
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(0)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()

            }.onAppear {
                NetworkManager.readArticle(with: article_snippet.web_url) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let text):
                            self.fullArticleText = text
                            print("odczytano!")
                        case .failure:
                            self.fullArticleText = "Failed to get full article text"
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ReadArticleView(article_snippet: MockData.sampleSnippet)
}
