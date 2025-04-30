    import SwiftUI

    struct CategoriesView: View {

        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        var body: some View {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing:10) {
                        ForEach(Categories.categories, id: \.name) { category in
                            NavigationLink(
                                destination: CategoryArticlesView(searchedCategory: category.name)
                            ) {
                                CategoryCell(category: category)
                            }
                        }
                    }
                    .padding(10)
                }
                .navigationTitle("Categories")
            }
        }
    }


    #Preview {
        CategoriesView()
    }
