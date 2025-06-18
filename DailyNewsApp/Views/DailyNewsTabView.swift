import SwiftUI

struct DailyNewsTabView: View {
    var body: some View {
        TabView {
            
            DailyNewsListView()
                .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                }
            
            KeywordsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "line.horizontal.3.decrease")
                    Text("Categories")
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
