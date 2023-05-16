import UIKit
protocol DetailsViewDelegate: AnyObject {
    func checkAction()
    func shareAction()
}

class DescriptionDetailsView: UIView {
    
    weak var delegate: DetailsViewDelegate?
    private var eventViewModel: EventViewModel?

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
    func configure(viewModel: EventViewModel?) {
        eventViewModel = viewModel
        tableView.reloadData()
    }
}

extension DescriptionDetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionDetailsCell.identifier, for: indexPath) as? DescriptionDetailsCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.delegate = self
        cell.configure(viewModel: eventViewModel)
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


