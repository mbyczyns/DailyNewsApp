import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContent{
    static let invalidData = AlertItem(title: Text("Server error"), message: Text("Data error - probably something wrong with the parsing"), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server error"), message: Text("Invalid response from server"), dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server error"), message: Text("Invalid URL error"), dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server error"), message: Text("Unable to complete your request. Check internet and if server is running"), dismissButton: .default(Text("OK")))
    
    static let noKeyword = AlertItem(title: Text("Missing Keyword!"), message: Text("You need to enter a keyword first."), dismissButton: .default(Text("OK")))
}
