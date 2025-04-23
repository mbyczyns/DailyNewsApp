import SwiftUI

struct KeywordsView: View {
    @State private var searchKeyword: String = ""
    @State private var alertItem: AlertItem?
    @StateObject var viewModel = SnippetsListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedSnippet: News_Snippet? = nil

    var body: some View {
        ZStack{
            NavigationView {
                VStack {
                    HStack{
                        TextField("Enter keyword...", text: $searchKeyword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button {
                            if searchKeyword != ""{
                                viewModel.getArticles(searchedPhrase: searchKeyword)
                            } else{
                                alertItem = AlertContent.noKeyword
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .frame(width: 44, height: 44)
                                .imageScale(.medium)
                        }
                    }
                    List(viewModel.snippets, id: \.title) { snippet in
                        SnippetListCell(snippet: snippet)
                            .onTapGesture {
                                withAnimation {
                                    selectedSnippet = snippet
                                    isShowingDetail = true
                                }
                            }
                    }
                }
                .background(Color.white.ignoresSafeArea())
                .navigationTitle("🔑 Search Keywords:")
                .padding()
                
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
        .alert(item: $alertItem) { alertItem in
                        Alert(title: alertItem.title,
                              message: alertItem.message,
                              dismissButton: alertItem.dismissButton)
                    }
    }
}

#Preview {
    KeywordsView()
}
