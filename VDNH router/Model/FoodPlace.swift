//
//  FoodPlace.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import Foundation

struct FoodPlace: Identifiable, Hashable {
    
    let id = UUID().uuidString
    let title: String
    var type: EventAndPlaceType = .foodPlace
    var placeType: FoodPlaceType
    let imageName: String
    var rating: Double? = nil
    var reviewsCount: UInt? = nil
    let action: VoidCompletion
    
    var ratingString: String? {
        guard let rating = rating else { return nil }
        return String(format: "%g", rating)
    }
    
    enum EventAndPlaceType: String {
        case excourse = "Экскурсия"
        case pavilion = "Павильон"
        case informationCenter = "Инфоцентр"
        case theater = "Театр"
        case interesting = "Интересно"
        case festival = "Фестиваль"
        case vystavka = "Выставка"
        case education = "Образование"
        case quest = "Квест"
        case outdoors = "На природе"
        case online = "Онлайн"
        case foodPlace = "Еда"
    }
    
    enum FoodPlaceType: String {
        case restaurant = "Ресторан"
        case cafe = "Кафе"
        case bistro = "Бистро"
        case streetFood = "Уличная еда"
        case bar = "Бар / Паб"
        case healthyFood = "Здоровая еда"
        case vegan = "Веган"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(imageName)
        hasher.combine(title)
    }
    
    static func == (lhs: FoodPlace, rhs: FoodPlace) -> Bool {
        lhs.id == rhs.id &&
        lhs.imageName == rhs.imageName &&
        lhs.title == rhs.title
    }
}
