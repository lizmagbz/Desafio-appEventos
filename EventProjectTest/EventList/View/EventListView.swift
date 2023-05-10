import UIKit

protocol EventListViewDelegate: AnyObject {
    func advenceAction()
}

class EventListView: UIView {
    
    weak var delegate: EventListViewDelegate?
    private var eventListViewModel: EventListViewModel?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.register(EventListCell.self, forCellReuseIdentifier: EventListCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    init() {
        super.init (frame: .zero)
        backgroundColor = .white
        configConstraints()
    }
    
    private func configConstraints() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint (equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension EventListView {
    func configure(viewModel: EventListViewModel?) {
        eventListViewModel = viewModel
        tableView.reloadData()
    }
}

extension EventListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventListViewModel?.numberOfSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventListViewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventListCell.identifier, for: indexPath) as? EventListCell else {
            return UITableViewCell()
        }
        let eventViewModel = eventListViewModel?.eventAtIndex(indexPath.row)
        cell.configure(viewModel: eventViewModel)
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}

extension EventListView: EventListCellDelegate {
    func advanceAction() {
        delegate?.advenceAction()
    }
}
