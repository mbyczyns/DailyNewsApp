import SwiftUI

struct DailyNewsListView: View {
    var body: some View {
        NavigationView{
            List(MockData.snippets, id: \.title) {snippet in
                SnippetListCell(snippet: snippet)
            }
            .navigationTitle("Snippets!")
        }
        
    }
}

#Preview {
    DailyNewsListView()
}
