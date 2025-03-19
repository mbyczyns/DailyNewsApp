import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:[.white, .orange,.red]), startPoint: .topTrailing, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text(inputText)
                    .padding()
                TextField("Search ...", text: $inputText).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
