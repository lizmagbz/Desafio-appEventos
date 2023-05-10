import UIKit
protocol DetailsViewDelegate: AnyObject {
    func checkAction()
    func shareAction()
}

class DescriptionDetailsView: UIView {
    
    weak var delegate: DetailsViewDelegate?
    private var eventListViewModel: EventListViewModel?

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.register(DescriptionDetailsCell.self, forCellReuseIdentifier: DescriptionDetailsCell.identifier)
        tableView.separatorStyle = .none
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
            tableView.bottomAnchor.constraint (equalTo:  safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension DescriptionDetailsView {
    func configure(viewModel: EventListViewModel?) {
        eventListViewModel = viewModel
        tableView.reloadData()
    }
}

extension DescriptionDetailsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventListViewModel?.numberOfSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventListViewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionDetailsCell.identifier, for: indexPath) as? DescriptionDetailsCell else {
            return UITableViewCell()
        }
        let eventViewModel = eventListViewModel?.eventAtIndex(indexPath.row)
        cell.configure(viewModel: eventViewModel)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
}

extension DescriptionDetailsView: DescriptionDetailsCellDelegate {
    func checkAction() {
        delegate?.checkAction()
    }
    
    func shareAction() {
        delegate?.shareAction()
    }
}


