import UIKit

class WebService {
    static func getEvents(completion: @escaping ([Event]?) -> Void) {
        
        if let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") {
            URLSession.shared.dataTask(with: url) { data, responder, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                } else if let data = data {
                    let eventList = try? JSONDecoder().decode([Event].self, from: data)
                    completion(eventList)
                }
            }.resume()
        } else {
            completion(nil)
        }
    }
}
