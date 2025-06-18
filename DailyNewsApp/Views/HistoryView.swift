import SwiftUI

struct HistoryView: View {
    
    let snippets: [News_Snippet]
    
    var body: some View {
        NavigationView {
            List(snippets, id: \.title) { snippet in
                SnippetListCell(snippet: snippet)
            }
            .navigationTitle("History")
        }
    }
}

#Preview {
    HistoryView(snippets: MockUser.ReadingHistory)
}
