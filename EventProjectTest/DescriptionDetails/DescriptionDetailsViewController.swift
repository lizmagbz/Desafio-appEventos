import UIKit

class DescriptionDetailsViewController: UIViewController {
    var viewDetails = DescriptionDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetails.delegate = self
        fetchData()
        
        view = viewDetails
    }
    
    private func fetchData() {
        
        WebService.getEvents() { eventList in
            
            if let event = eventList {
                let eventListViewModel = EventListViewModel(events: event)
                
                DispatchQueue.main.async {
                    self.viewDetails.configure(viewModel: eventListViewModel)
                }
            }
        }
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
