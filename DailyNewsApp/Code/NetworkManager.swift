import Foundation
import UIKit

final class NetworkManager{
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
        
//    final let testURL = baseURL + "/search?q=Paris"
    
    struct API {
        static let baseURL = "http://192.168.0.106:5555"

        static func buildURL(with endpoint: String) -> URL? {
            return URL(string: baseURL + endpoint)
        }
    }

    
    private init() {}
    
    func getArticles(searchedPhrase: String, completed: @escaping (Result<[News_Snippet], DNError>) -> Void) {
        guard let url = API.buildURL(with: "/search?fq=" + searchedPhrase) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                        completed(.failure(.invalidResponse))
                        return
                    }

            switch response.statusCode {
                case 200:
                    break // OK
                case 500:
                    completed(.failure(.keywordNotFound))
                    return
                default:
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
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }

    
}
