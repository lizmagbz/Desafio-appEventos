import UIKit

class EventListViewController: UIViewController {
    var eventListView = EventListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventListView.delegate = self
        fetchData()
        
        view = eventListView
    }
    
    private func fetchData() {
        
        WebService.getEvents() { eventList in
            
            if let event = eventList {
                let eventListViewModel = EventListViewModel(events: event)
                
                DispatchQueue.main.async {
                    self.eventListView.configure(viewModel: eventListViewModel)
                }
            }
        }
    }
}

extension EventListViewController: EventListViewDelegate {
    func advenceAction(viewModel: EventViewModel) {
        let detailsViewController = DescriptionDetailsViewController(eventViewModel: viewModel)
        detailsViewController.modalPresentationStyle = .fullScreen
        present(detailsViewController, animated: true, completion: nil)
    }
}


