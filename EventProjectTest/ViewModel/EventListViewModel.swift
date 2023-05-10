import UIKit

struct EventListViewModel {
    let events: [Event]
}

extension EventListViewModel {
    
    var numberOfSection:  Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.events.count
    }
    
    func eventAtIndex(_ index: Int) -> EventViewModel {
        let event = self.events[index]
        return EventViewModel(event)
    }
}

struct EventViewModel {
    private let event: Event
}

extension EventViewModel {
    init(_ event: Event) {
        self.event = event
    }
}

extension EventViewModel {
    
    var date: Double {
        return self.event.date ?? 0.0
    }
    
    var description: String {
        return self.event.description ?? ""
    }
    
    var image: String {
        return self.event.image ?? ""
    }
    
    var longitude: Double {
        return self.event.longitude ?? 0.0
    }
    
    var latitude: Double {
        return self.event.latitude ?? 0.0
    }
    
    var price: Double {
        return self.event.price ?? 0.0
    }
    
    var title: String {
        return self.event.title ?? ""
    }
    
    var id: String {
        return self.event.id ?? ""
    }
}
