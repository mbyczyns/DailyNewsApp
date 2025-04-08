import SwiftUI

struct DailyNewsTabView: View {
    var body: some View {
        TabView{
            DailyNewsListView()
                .tabItem{
                    Image(systemName:  "house")
                    Text("Home")
                }
            
            CategoriesView()
                .tabItem{
                    Image(systemName: "line.horizontal.3.decrease")
                    Text("Categories")
                }
            
            KeywordsView()
                .tabItem{
                    Image(systemName:  "magnifyingglass")
                    Text("Search")
                }
            
            MyNewsView()
                .tabItem{
                    Image(systemName:  "heart")
                    Text("My News")
                }
            AccountView()
                .tabItem{
                    Image(systemName:  "person")
                    Text("Profile")
                }
        }
    }
        
}

#Preview {
    DailyNewsTabView()
}
