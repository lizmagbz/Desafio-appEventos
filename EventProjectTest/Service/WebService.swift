import UIKit
import Alamofire

class WebService {
    static func getEvents(completion: @escaping ([Event]?) -> Void) {
        
        if let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") {
            AF.request(url).responseData { response in
                switch response.result {
                case.success(let data):
                    let eventList = try? JSONDecoder().decode([Event].self, from: data)
                    completion(eventList)
                case let .failure(error):
                    print(error)
                }
            }
        } else {
            completion(nil)
        }
    }
}
