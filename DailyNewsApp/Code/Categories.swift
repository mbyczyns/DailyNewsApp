import SwiftUI
import Foundation

struct Category {
    let name: String
    let systemIconName: String
    let color: RGBColor

    var icon: Image {
        Image(systemName: systemIconName)
    }

}

struct RGBColor {
    let red: Double
    let green: Double
    let blue: Double

    var color: Color {
        Color(red: red, green: green, blue: blue)
    }
}

struct Categories {
    static let Business = Category(name: "Business", systemIconName: "dollarsign.circle", color: RGBColor(red: 0.4, green: 0.8, blue: 0.5))
    static let Science = Category(name: "Science", systemIconName: "atom", color: RGBColor(red: 0.1, green: 0.8, blue: 0.8))
    static let Politics = Category(name: "Politics", systemIconName: "building.columns.fill", color: RGBColor(red: 0.6, green: 0.6, blue: 0.6))
    static let Weather = Category(name: "Weather", systemIconName: "cloud.sun", color: RGBColor(red: 0.9, green: 0.8, blue: 0.2))
    static let Travel = Category(name: "Travel", systemIconName: "airplane", color:RGBColor(red: 0.4, green: 0.5, blue: 0.8))
    static let Health = Category(name: "Health", systemIconName: "stethoscope", color: RGBColor(red: 0.8, green: 0.2, blue: 0))
    static let Sports = Category(name: "Sports", systemIconName: "figure.run", color: RGBColor(red: 0.5, green: 0.5, blue: 0.5))
    static let Books = Category(name: "Books", systemIconName: "books.vertical", color:RGBColor(red: 0.9, green: 0.4, blue: 0.4))
    static let Arts = Category(name: "Arts", systemIconName: "theatermask.and.paintbrush", color: RGBColor(red: 0.4, green: 0.8, blue: 0.4))
    static let Fashion = Category(name: "Fashion", systemIconName: "tshirt", color: RGBColor(red: 0.6, green: 0.5, blue: 0.3))
}

