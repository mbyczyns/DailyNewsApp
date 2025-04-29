import SwiftUI

final class SnippetsListViewModel: ObservableObject {
    @Published var snippets: [News_Snippet] = []
    @Published var alertItem: AlertItem?
    
    func getArticles(searchedPhrase: String) {
        NetworkManager.shared.getArticles(searchedPhrase: searchedPhrase) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let snippets):
                    self.snippets = snippets
                case .failure(let error):
                    switch error {
                        case .invalidResponse:
                            self.alertItem = AlertContent.invalidResponse
                        case .invalidURL:
                            self.alertItem = AlertContent.invalidURL
                        case .invalidData:
                            self.alertItem = AlertContent.invalidData
                        case .unableToComplete:
                            self.alertItem = AlertContent.unableToComplete
                        case .noKeyword:
                            self.alertItem = AlertContent.noKeyword
                        case .keywordNotFound:
                            self.alertItem = AlertContent.keywordNotFound
                    }
                }
            }
        }
    }
}
