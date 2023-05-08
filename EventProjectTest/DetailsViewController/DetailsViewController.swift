import UIKit

class DetailsViewController: UIViewController {
    var viewDetails = DetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetails.delegate = self
        
        view = viewDetails
    }
}

extension DetailsViewController: DetailsViewDelegate {
    func checkAction() {
        print("check-in")
    }

    func shareAction() {
        print("Compartilhei")
    }
}
