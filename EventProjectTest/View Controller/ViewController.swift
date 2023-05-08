import UIKit

class ViewController: UIViewController {
    var viewTable = Firstview()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTable.delegate = self
        
        view = viewTable
    }
}

extension ViewController: FirstviewDelegate {
    func advenceAction() {
        let detailsViewController = DetailsViewController()
        detailsViewController.modalPresentationStyle = .fullScreen
        present(detailsViewController, animated: true, completion: nil)
    }
}


