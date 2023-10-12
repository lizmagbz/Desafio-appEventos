import Foundation

struct Subscription: Decodable {
    var code: String
}

func makePOSTRequest(viewModel: EventViewModel, completion: @escaping (Subscription?) -> Void) {
    guard let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/checkin") else { return }
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    let body: [String: String] = [
        "eventId": "\(viewModel.id)",
        "name": "Liz Mabel",
        "email": "mabelgomes918@gmail.com",
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    URLSession.shared.dataTask(with: request) { data, responseData, error in
        guard let data = data, error == nil else { return }
        
        do {
            let subscription = try? JSONDecoder().decode(Subscription.self, from: data)
            completion(subscription)
        }
    }.resume()
}
