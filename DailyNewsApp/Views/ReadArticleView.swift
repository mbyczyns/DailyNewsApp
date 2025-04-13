//
//  ReadArticleView.swift
//  DailyNewsApp
//
//  Created by Marcin Byczyński on 13/04/2025.
//

import SwiftUI

struct ReadArticleView: View {
    
    let article_snippet: News_Snippet
    
    var body: some View {
        VStack{
            Image("photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(article_snippet.title)
                .font(.title)
                .fontWeight(.heavy)
                .padding(20)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Text(article_snippet.print_headline)
                .font(.title2)
                .fontWeight(.medium)
                .padding([.leading, .trailing, .bottom], 20)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            Link(destination: URL(string: article_snippet.web_url)!) {
                    Text("Czytaj w New York Times")  // albo `article_snippet.web_url` jeśli chcesz wyświetlać link
                        .foregroundColor(.blue)      // styl linku
                        .underline()
                }        }
//        .overlay(Button {
//            print("exit")
//        } label: {
//            ZStack{
//                Circle()
//                    .frame(width: 40, height: 40)
//                    .foregroundColor(.white)
//                    .opacity(0.6)
//                
//                Image(systemName: "xmark")
//                    .frame(width: 70, height: 70)
//                    .imageScale(.medium)
//            }
//        }, alignment: .topTrailing)
    }
}

#Preview {
    ReadArticleView(article_snippet: MockData.sampleSnippet)
}
