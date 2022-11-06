//
//  YourInterests.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 04.11.2022.
//

struct YourInterests: Hashable {
    
    let iconName: String
    let title: String
    let placeCount: UInt
    let action: VoidCompletion
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iconName)
        hasher.combine(title)
        hasher.combine(placeCount)
    }
    
    static func == (lhs: YourInterests, rhs: YourInterests) -> Bool {
        lhs.title == rhs.title &&
        lhs.placeCount == rhs.placeCount
    }
}
