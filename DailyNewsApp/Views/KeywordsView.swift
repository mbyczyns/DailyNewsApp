import SwiftUI

struct KeywordsView: View {
    @State private var searchKeyword: String = ""
    @State private var alertItem: AlertItem?

    var body: some View {
        
        NavigationView {
            VStack {
                HStack{
                    TextField("Enter keyword...", text: $searchKeyword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        if searchKeyword != ""{
                            print("making a request with keyword: " +  searchKeyword)
                        } else{
                            alertItem = AlertContent.noKeyword
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .frame(width: 44, height: 44)
                            .imageScale(.medium)
                    }
                }
                Text(searchKeyword)
                Spacer()
            }
            .navigationTitle("🔑 Search Keywords:")
            .padding()
            .alert(item: $alertItem) { alertItem in
                            Alert(title: alertItem.title,
                                  message: alertItem.message,
                                  dismissButton: alertItem.dismissButton)
                        }
        }
    }
}

#Preview {
    KeywordsView()
}
