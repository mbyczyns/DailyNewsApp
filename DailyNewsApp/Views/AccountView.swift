import SwiftUI

struct AccountView: View {
    
    let tempUser: User;
    
    var body: some View {
        NavigationView{
            VStack{
                ArticleRemoteImage(urlString: tempUser.ProfileImageUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 3)
                    .padding(.top, 30)
                Text(tempUser.Username)
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.top,20)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Text(" \(tempUser.WatchedArticlesAmount) articles read")
                    .padding(.top,10)
                    .foregroundColor(.gray)
                HStack(spacing: 24) {
                                   
                   NavigationLink {
                       HistoryView(snippets: tempUser.ReadingHistory)
                   } label: {
                       SquareButton(icon: "clock.fill",
                                    title: "History",
                                    color: .blue)
                   }
                   
                   NavigationLink {
//                       SettingsView()
                       KeywordsView()
                   } label: {
                       SquareButton(icon: "heart.fill",
                                    title: "Liked Articles",
                                    color: .green)
                   }
               }
               .padding(.top, 30)
                Spacer()
            }
            .navigationTitle("My Account")
        }
        
    }
}

struct SquareButton: View {
    let icon: String
    let title: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .frame(width: 120, height: 120)
        .foregroundColor(.white)
        .background(color)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

#Preview {
    AccountView(tempUser:MockUser)
}
