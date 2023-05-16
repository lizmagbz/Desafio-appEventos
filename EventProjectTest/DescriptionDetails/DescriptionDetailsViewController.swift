import UIKit

class DescriptionDetailsViewController: UIViewController {
    var viewDetails = DescriptionDetailsView()
    var eventViewModel: EventViewModel
    
    init(eventViewModel: EventViewModel) {
        self.eventViewModel = eventViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetails.delegate = self
        viewDetails.configure(viewModel: eventViewModel)
        
        view = viewDetails
    }
}

extension DescriptionDetailsViewController: DetailsViewDelegate {
    func checkAction() {
        print("check-in")
    }

    func shareAction() {
        print("Compartilhei")
    }
}
