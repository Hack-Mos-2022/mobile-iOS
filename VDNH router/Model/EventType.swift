//
//  EventType.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

struct EventType: Hashable {
    
    let iconName: String
    let title: String
    let action: VoidCompletion
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iconName)
        hasher.combine(title)
    }
    
    static func == (lhs: EventType, rhs: EventType) -> Bool {
        lhs.title == rhs.title
    }
}
