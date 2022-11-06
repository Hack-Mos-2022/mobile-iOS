//
//  Excursion.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 30.10.2022.
//

import SwiftUI

struct Excursion: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    var titleColor: Color = .black90
    var subtitle: String = ""
    var subtitleColor: Color = .black90
    let image: String
    var topText: String? = nil
    var type: EventAndPlaceType? = nil
    var isLiked: Bool = false
    var startTime: String? = nil
    
    enum EventAndPlaceType: String {
        case excourse = "Экскурсия"
        case pavilion = "Павильон"
        case informationCenter = "Инфоцентр"
        case theater = "Театр"
        case interesting = "Интересно"
        case festival = "Фестиваль"
        case vystavka = "Выставка"
        case level = "12 LVL"
    }
    
}

var excursions: [Excursion] = [
    Excursion(title: "«Классная программа»", subtitle: "Занятия для учеников 1-11 классов", image: "image_1", type: .excourse, isLiked: true),
    Excursion(title: "Бесплатные экскурсии", subtitle: "Бесплатные экскурсии в музее «Слово»", image: "image_2", type: .excourse),
    Excursion(title: "Квесты", subtitle: "Экскурсия-квест «Кирилл и Мефодий: миссия выполнима»", image: "image_3", type: .excourse),
    Excursion(title: "Ожидаемые мероприятия", subtitle: "Космонавтика и авиация", image: "image_4", type: .excourse),
//    Album(title: "Event5", subtitle: "Subtitle Event5", image: "image_5", type: .excourse),
//    Album(title: "Event6", subtitle: "Subtitle Event6", image: "image_6", type: .excourse),
//    Album(title: "Event7", subtitle: "Subtitle Event7", image: "image_7", type: .excourse),
]
