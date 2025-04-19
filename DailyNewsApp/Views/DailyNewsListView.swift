import SwiftUI

struct DailyNewsListView: View {
    
    @StateObject var viewModel = SnippetsListViewModel()
    
    
    var body: some View {
        NavigationView{
            List(viewModel.snippets, id: \.title) {snippet in
                SnippetListCell(snippet: snippet)
            }
            .navigationTitle("Snippets!")
        }
        .onAppear{
            viewModel.getArticles()
        }
        .alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  )}
    }
}

#Preview {
    DailyNewsListView()
}
