import SwiftUI

struct ArticleDetailedView: View {
    
    let article_snippet: News_Snippet
    
    var body: some View {
        VStack{
            Image("photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(article_snippet.title)
                .padding(10)
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Text(article_snippet.pub_date)
                .font(.caption)
                .foregroundColor(.gray)
                .fontWeight(.medium)
            Text(article_snippet.print_headline)
                .padding(10)
                .font(.body)
                .fontWeight(.light)
                .frame(maxWidth: 350)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            HStack(spacing: 16) {
                Button(action: {}) {
                    Text("Read now")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Button(action: {}) {
                    Text("Save for later")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
            .padding(20)
            
            
            
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 8)
        .overlay(Button {
            print("exit")
        } label: {
            ZStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .frame(width: 44, height: 44)
                    .imageScale(.small)
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    ArticleDetailedView(article_snippet: MockData.sampleSnippet)
}
