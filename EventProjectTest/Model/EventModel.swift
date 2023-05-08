import UIKit

struct Events: Codable {
    let events: [EventList?]
}

struct EventList: Codable {
    let date: String?
    let description: String?
    let image: String?
    let longitude: Double?
    let latitude: Double?
    let price: Double?
    let title: String?
    let id: Int?
}
