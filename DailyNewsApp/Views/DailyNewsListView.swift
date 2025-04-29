import SwiftUI

struct DailyNewsListView: View {
    
    @StateObject var viewModel = SnippetsListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedSnippet: News_Snippet? = nil
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.snippets, id: \.title) { snippet in
                    SnippetListCell(snippet: snippet)
                        .onTapGesture {
                            withAnimation {
                                selectedSnippet = snippet
                                isShowingDetail = true
                            }
                        }
                }
                .navigationTitle("Snippets!")
            }
            .onAppear {
                viewModel.getArticles(searchedPhrase: "Phasmophobia")
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            .disabled(isShowingDetail)

            if isShowingDetail, let snippet = selectedSnippet {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .transition(.opacity)

                ArticleDetailedView(article_snippet: snippet, isShowingDetail: $isShowingDetail)
                    .transition(.scale)
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: isShowingDetail)
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message
            )
        }
    }
}


#Preview {
    DailyNewsListView()
}
