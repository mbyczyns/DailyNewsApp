import Foundation

enum DNError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case noKeyword
    case keywordNotFound
}
