import SwiftUI

struct DailyNewsListView: View {
    
    @State private var snippets: [News_Snippet] = []
    
    var body: some View {
        NavigationView{
            List(snippets, id: \.title) {snippet in
                SnippetListCell(snippet: snippet)
            }
            .navigationTitle("Snippets!")
        }
        .onAppear{
            getArticles()
        }
    }
    
    func getArticles(){
        NetworkManager.shared.getArticles{ result in
            DispatchQueue.main.async{
                switch result{
                case .success(let snippets):
                    self.snippets = snippets
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}

#Preview {
    DailyNewsListView()
}
