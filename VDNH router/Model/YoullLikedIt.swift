//
//  YoullLikedIt.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

import Foundation

struct YoullLikedIt: Identifiable, Hashable {
    
    let id = UUID().uuidString
    let title: String
    var type: EventAndPlaceType? = nil
    var allCount: UInt? = nil
    let imageName: String
    var placeCount: UInt? = nil
    var placeCountText: String? = nil
    let action: VoidCompletion
    
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
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(imageName)
        hasher.combine(title)
        hasher.combine(placeCount)
    }
    
    static func == (lhs: YoullLikedIt, rhs: YoullLikedIt) -> Bool {
        lhs.id == rhs.id &&
        lhs.imageName == rhs.imageName &&
        lhs.title == rhs.title &&
        lhs.placeCount == rhs.placeCount
    }
}
