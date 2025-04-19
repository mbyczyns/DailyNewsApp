import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    
    static let baseURL = "http://192.168.1.50:5555"
    private let keywordsURL = baseURL + "/search"
    private let categoriesURL = baseURL + "/categories"
    private let testURL = baseURL + "/search?q=Paris"
    
    private init() {}
    
    func getArticles(completed: @escaping (Result<[News_Snippet], DNError>) -> Void) {
        guard let url = URL(string: testURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let snippets = try decoder.decode([News_Snippet].self, from: data)
                completed(.success(snippets))
            } catch {
                print("Decoding failed: \(error)")
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }

    
}
