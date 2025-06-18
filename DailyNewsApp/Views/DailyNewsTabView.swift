import SwiftUI

struct DailyNewsTabView: View {
    var body: some View {
        TabView {
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "line.horizontal.3.decrease")
                    Text("Categories")
                }
            
            KeywordsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            DailyNewsListView()
                .tabItem {
                        Image(systemName: "sparkles")
                        Text("Suggest")
                }

            AccountView(tempUser: MockUser)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
        
}

#Preview {
    DailyNewsTabView()
}
