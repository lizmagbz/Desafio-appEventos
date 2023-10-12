import UIKit

class EventListViewController: UIViewController {
    
    private var eventListViewModel: EventListViewModel? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        self.tableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "EventTableViewCell")
        navigationItem.title = "EVENTOS"
        fetchData()
    }
    
    private func fetchData() {
        
        WebService.getEvents() { eventList in
            
            if let event = eventList {
                
                DispatchQueue.main.async {
                    self.eventListViewModel = EventListViewModel(events: event)
                }
            }
        }
    }
}

extension EventListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventListViewModel?.numberOfSection ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventListViewModel?.numberOfRowsInSection(section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell else {
            return UITableViewCell()
        }
        let eventViewModel = eventListViewModel?.eventAtIndex(indexPath.row)
        cell.configure(viewModel: eventViewModel)
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}

extension EventListViewController: EventListCellDelegate {
    func advanceAction(viewModel: EventViewModel) {
        let detailsViewController = DescriptionDetailsViewController(eventViewModel: viewModel)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}


