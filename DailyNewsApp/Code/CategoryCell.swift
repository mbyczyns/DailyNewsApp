import SwiftUI

struct CategoryCell: View {
    let category: Category
    var body: some View {
        HStack{
            VStack {
                Image(systemName: category.systemIconName)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color.white)
                    .padding(.top, 10)
                Text(category.name)
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
            }
            .frame(maxWidth: 170, maxHeight: 170)
            .background(category.color.color)
            .cornerRadius(20)
        }
    }
        
}

#Preview {
    CategoryCell(
        category: Categories.Arts
    )
}
