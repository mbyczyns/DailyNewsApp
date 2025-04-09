import SwiftUI

struct KeywordsView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter keyword...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
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
