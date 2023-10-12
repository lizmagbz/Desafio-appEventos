import UIKit

class SubscriptionViewController: UIViewController {
    
    override func loadView() {
        let subscriptionView = SubscriptionView()
        
        view = subscriptionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}
