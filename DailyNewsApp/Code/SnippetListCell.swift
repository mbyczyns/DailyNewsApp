import SwiftUI

struct SnippetListCell: View {
    
    let snippet: News_Snippet
    var body: some View {
        HStack{
            VStack{
                ArticleRemoteImage(urlString: snippet.main_image_url)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 240)
                    .cornerRadius(8)
                Text(snippet.pub_date)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                Text(snippet.title)
                    .font(.title3)
                    .fontWeight(.medium)
                    .frame(maxWidth: 350)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }

        }
    }
}

#Preview {
    SnippetListCell(snippet: MockData.sampleSnippet)
}
