import SwiftUI

struct ArticleDetailedView: View {
    
    let article_snippet: News_Snippet
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            ArticleRemoteImage(urlString: article_snippet.main_image_url)
                .aspectRatio(contentMode: .fit)
                .frame(width: 330, height: 210)
            
            VStack {
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
                
                VStack {
                    
                    Button(action: { print("czytamm") }) {
                        Text("Read now")
                            .frame(maxWidth: .infinity)
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
            }
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            HStack(spacing: 10) {
                Button {
                    print("downloaded article") // TODO
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .opacity(0.8)
                        Image(systemName: "square.and.arrow.down")
                            .frame(width: 44, height: 44)
                            .imageScale(.medium)
                    }
                }

                Button {
                    isShowingDetail = false
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .opacity(0.8)
                        Image(systemName: "xmark")
                            .frame(width: 44, height: 44)
                            .imageScale(.small)
                    }
                }
            }
            .padding(8),
            alignment: .topTrailing
        )

    }
}

#Preview {
    ArticleDetailedView(article_snippet: MockData.sampleSnippet, isShowingDetail: .constant(true))
}
