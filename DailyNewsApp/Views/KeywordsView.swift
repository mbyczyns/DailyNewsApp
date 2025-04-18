import SwiftUI

struct KeywordsView: View {
    @State private var searchText: String = ""

    var body: some View {
        
        NavigationView {
            VStack {
                TextField("Enter keyword...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(searchText)
                Spacer()
            }
            .navigationTitle("🔑 Search Keywords:")
            .padding()
        }
    }
}

#Preview {
    KeywordsView()
}
