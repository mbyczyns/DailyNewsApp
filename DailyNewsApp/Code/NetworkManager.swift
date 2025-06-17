import Foundation
import UIKit

final class NetworkManager{
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    struct API {
        static let baseURL = "http://127.0.0.1:5555"

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
                    break
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
    
    static func likeArticle(with article_url: String, completed: @escaping (Result<Void, DNError>) -> Void) {
        guard let url = API.buildURL(with: "/likearticle?fq=" + article_url) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { _, response, error in
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completed(.failure(.invalidResponse))
                return
            }

            switch httpResponse.statusCode {
            case 200:
                completed(.success(())) // Operacja się powiodła, brak danych
            default:
                completed(.failure(.invalidResponse))
            }
        }
        print("article liked")
        task.resume()
    }
    
    static func readArticle(with article_url: String, completed: @escaping (Result<String, DNError>) -> Void) {
        guard let url = API.buildURL(with: "/readarticle?fq=" + article_url) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  let data = data else {
                completed(.failure(.invalidResponse))
                return
            }

            switch httpResponse.statusCode {
            case 200:
                do {
                    // Dekoduj JSON, wyciągnij "text"
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let text = json["article_text"] as? String {
                        completed(.success(text))
                    } else {
                        completed(.failure(.invalidData))
                    }
                } catch {
                    completed(.failure(.invalidData))
                }
            default:
                completed(.failure(.invalidResponse))
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
