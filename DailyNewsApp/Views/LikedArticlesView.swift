import SwiftUI

struct LikedArticlesView: View {
    
    let snippets: [News_Snippet]
    
    var body: some View {
        NavigationView {
            List(snippets, id: \.title) { snippet in
                SnippetListCell(snippet: snippet)
            }
            .navigationTitle("Liked Articles")
        }
    }
}

#Preview {
    LikedArticlesView(snippets: MockUser.LikedArticles)
}
