//
//  AllVDNHModels.swift
//  VDNH router
//
//  Created by Anatoliy Podkladov on 30.10.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let mapStyle: String
    let cats: [CatElement]
    let icons: [String: String]
    let types: [String: [String: String?]]
    let visitors: Visitors
    let stelas: [String: Stela]
    let facilities: [String: [String: String?]]
    let places: [String: Place]
    let events: [String: Event]
    let selections: [Selection]
    let routes: [Route]
    let suggests: [Suggest]
    let videos: Videos
    let modesContent: JSONNull?

    enum CodingKeys: String, CodingKey {
        case mapStyle = "map_style"
        case cats, icons, types, visitors, stelas, facilities, places, events, selections, routes, suggests, videos
        case modesContent = "modes_content"
    }
}

// MARK: - CatElement
struct CatElement: Codable {
    let id, sort, name: String
    let theme: [JSONAny]
    let icon: String
    let color: String
    let ids: [Int]
    let places, events: [String]
}

// MARK: - Event
struct Event: Codable {
    let qr: String
    let id: Int
    let order: Order
    let coordinates: [Double]?
    let schedule, contacts: [Contact]
    let cat: CatEnum
    let visibility: VDNHVisibility
    let places, theme: [String]?
    let facilities: [String]
    let tickets: [TicketElement]
    let ticketsLink: String?
    let ticketsText: String?
    let zoom: Double
    let color: VDNHColor
    let colorCode: ColorCode
    let showTitle, mapTitle, previewText, detailText: String
    let title: String
    let nameStela: JSONNull?
    let time, type, typeID, eventIcon: String
    let icon: String
    let mapIcon: Int
    let sIcon: SIcon
    let url: String
    let pic: String
    let code: String
    let walking: WalkingUnion
    let videoRoute: String?
    let events: [Int]?

    enum CodingKeys: String, CodingKey {
        case qr, id, order, coordinates, schedule, contacts, cat, visibility, places, theme, facilities, tickets
        case ticketsLink = "tickets_link"
        case ticketsText = "tickets_text"
        case zoom, color
        case colorCode = "color_code"
        case showTitle = "show_title"
        case mapTitle = "map_title"
        case previewText = "preview_text"
        case detailText = "detail_text"
        case title
        case nameStela = "name_stela"
        case time, type
        case typeID = "type_id"
        case eventIcon = "icon"
        case icon = "_icon"
        case mapIcon = "map_icon"
        case sIcon = "s_icon"
        case url, pic, code, walking
        case videoRoute = "video_route"
        case events
    }
}

enum CatEnum: String, Codable {
    case event = "event"
    case place = "place"
}

enum VDNHColor: String, Codable {
    case e8773F = "#E8773F"
    case f0Af18 = "#F0AF18"
    case the000000 = "#000000"
    case the336Af7 = "#336AF7"
    case the59B36A = "#59B36A"
    case the60Afa9 = "#60AFA9"
    case the7849Dc = "#7849DC"
}

enum ColorCode: String, Codable {
    case aquamarine = "aquamarine"
    case black = "black"
    case blue = "blue"
    case green = "green"
    case grey = "grey"
    case orange = "orange"
    case purple = "purple"
    case yellow = "yellow"
}

// MARK: - Contact
struct Contact: Codable {
    let contactLeft, contactRight: String

    enum CodingKeys: String, CodingKey {
        case contactLeft = "left"
        case contactRight = "right"
    }
}

enum Order: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Order.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Order"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum SIcon: String, Codable {
    case fountain = "fountain"
}

enum TicketElement: Codable {
    case string(String)
    case ticketClass(TicketClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(TicketClass.self) {
            self = .ticketClass(x)
            return
        }
        throw DecodingError.typeMismatch(TicketElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for TicketElement"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .ticketClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - TicketClass
struct TicketClass: Codable {
    let title, value, ticketDescription: String

    enum CodingKeys: String, CodingKey {
        case title, value
        case ticketDescription = "description"
    }
}

enum VDNHVisibility: String, Codable {
    case visible = "visible"
}

enum WalkingUnion: Codable {
    case anythingArray([JSONAny])
    case walkingValueMap([String: WalkingValue])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode([String: WalkingValue].self) {
            self = .walkingValueMap(x)
            return
        }
        throw DecodingError.typeMismatch(WalkingUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for WalkingUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .walkingValueMap(let x):
            try container.encode(x)
        }
    }
}

// MARK: - WalkingValue
struct WalkingValue: Codable {
    let d, t: String
}

// MARK: - Place
struct Place: Codable {
    let qr: String?
    let id: Int?
    let order: Order?
    let coordinates: [Double]?
    let schedule, contacts: [Contact]?
    let facilities: [String]?
    let videoRoute: String?
    let tickets: [TicketElement]?
    let ticketsLink: String?
    let ticketsText: String?
    let cat: CatEnum?
    let visibility: VDNHVisibility?
    let zoom: Double?
    let color: VDNHColor?
    let colorCode: ColorCode?
    let showTitle, mapTitle, previewText, detailText: String?
    let title: String?
    let nameStela: JSONNull?
    let time, type, typeID, placeIcon: String?
    let icon: String?
    let mapIcon: Int?
    let sIcon: SIcon?
    let url: String?
    let pic: String?
    let code: String?
    let walking: [String: WalkingValue]?
    let events: [Int]?
    let places, theme: [String]?

    enum CodingKeys: String, CodingKey {
        case qr, id, order, coordinates, schedule, contacts, facilities
        case videoRoute = "video_route"
        case tickets
        case ticketsLink = "tickets_link"
        case ticketsText = "tickets_text"
        case cat, visibility, zoom, color
        case colorCode = "color_code"
        case showTitle = "show_title"
        case mapTitle = "map_title"
        case previewText = "preview_text"
        case detailText = "detail_text"
        case title
        case nameStela = "name_stela"
        case time, type
        case typeID = "type_id"
        case placeIcon = "icon"
        case icon = "_icon"
        case mapIcon = "map_icon"
        case sIcon = "s_icon"
        case url, pic, code, walking, events, places, theme
    }
}

// MARK: - Route
struct Route: Codable {
    let id, url: String
    let pic: String
    let detailPic: String
    let title, code, time: String
    let items: [Item]
    let points: Int
    let detail: String

    enum CodingKeys: String, CodingKey {
        case id, url, pic
        case detailPic = "detail_pic"
        case title, code, time, items, points, detail
    }
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let event: JSONNull?
    let place: String
    let duration: String?
    let preview: String
}

// MARK: - Selection
struct Selection: Codable {
    let id, url: String
    let pic, detailPic: String
    let preview, detail, title: String
    let places: [JSONAny]
    let events: [Int]
    let code, count: String

    enum CodingKeys: String, CodingKey {
        case id, url, pic
        case detailPic = "detail_pic"
        case preview, detail, title, places, events, code, count
    }
}

// MARK: - Stela
struct Stela: Codable {
    let id, name: String
    let tops: [Top]?
    let orient, utm: String?
    let coords: [Double]
    let ip: String
    let searchPlaces, searchEvents: [String]
    let siteOn: JSONNull?
    let stelaCats: [JSONAny]
    let bgColor, textColor, buttonColor, showTopInSection: JSONNull?
    let showTopInDetail: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name, tops, orient, utm, coords, ip
        case searchPlaces = "search_places"
        case searchEvents = "search_events"
        case siteOn = "site_on"
        case stelaCats = "stela_cats"
        case bgColor = "bg_color"
        case textColor = "text_color"
        case buttonColor = "button_color"
        case showTopInSection = "show_top_in_section"
        case showTopInDetail = "show_top_in_detail"
    }
}

// MARK: - Top
struct Top: Codable {
    let id, sort: String
    let stela: [String]
    let place: String
    let places: [JSONAny]
    let time: JSONNull?
    let name: Name
    let previewText, image, video: String

    enum CodingKeys: String, CodingKey {
        case id, sort, stela, place, places, time, name
        case previewText = "preview_text"
        case image, video
    }
}

enum Name: String, Codable {
    case главныйКатокМосквы = "Главный каток Москвы"
    case космонавтикаИАвиация = "«Космонавтика и авиация»"
    case мастерКлассПоЛеттерингу = "Мастер-класс по леттерингу"
    case москвариум = "Москвариум"
    case павильон34ЦентрКосмонавтикаИАвиация = "Павильон №34. Центр «Космонавтика и авиация»"
    case точка1 = "Точка 1"
    case центрКосмонавтикаИАвиация = "Центр «Космонавтика и авиация»"
    case центрСлово = "Центр «Слово»"
}

// MARK: - Suggest
struct Suggest: Codable {
    let id, title, sort: String
    let stela, suggestDescription: JSONNull?
    let link: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, title, sort, stela
        case suggestDescription = "description"
        case link, icon
    }
}

// MARK: - Videos
struct Videos: Codable {
    let the8702: [The8702]

    enum CodingKeys: String, CodingKey {
        case the8702 = "8702"
    }
}

// MARK: - The8702
struct The8702: Codable {
    let id, name, title: String
    let file: String
}

// MARK: - Visitors
struct Visitors: Codable {
    let sections: [Section]
    let items: Items
}

// MARK: - Items
struct Items: Codable {
    let the54, the55, the58, the86: [Empty]
    let the341, the349, the362, empty: [Empty]

    enum CodingKeys: String, CodingKey {
        case the54 = "54"
        case the55 = "55"
        case the58 = "58"
        case the86 = "86"
        case the341 = "341"
        case the349 = "349"
        case the362 = "362"
        case empty = ""
    }
}

// MARK: - Empty
struct Empty: Codable {
    let id, name, text: String
}

// MARK: - Section
struct Section: Codable {
    let id, name: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

