import SwiftUI

struct SnippetListCell: View {
    
    let snippet: News_Snippet
    var body: some View {
        HStack{
            VStack{
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 240)
                    .cornerRadius(8)
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
