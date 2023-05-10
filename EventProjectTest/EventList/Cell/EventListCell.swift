import UIKit

protocol EventListCellDelegate: AnyObject {
    func advanceAction()
}

class EventListCell: UITableViewCell {
    
    weak var delegate: EventListCellDelegate?
    static let identifier: String = "EventListCell"
    
    private lazy var eventImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16.0
        imageView.layer.borderColor = UIColor.systemPurple.cgColor
        imageView.layer.borderWidth = 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            eventLabel,
            dataLabel,
            detailsButton
        ])
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.backgroundColor = .clear
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -24)
        return stackView
    }()
    
    private lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.contentMode = .scaleAspectFill
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.text = "18/11/2023"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var detailsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget (self, action: #selector (advanceAction), for: .touchUpInside)
        return button
    }()
    
    private func setConditionsButtonTitle() {
       detailsButton.backgroundColor = .clear
       let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.systemGray3,
          .font: UIFont.systemFont(ofSize: 14, weight: .regular),
          .underlineStyle: NSUnderlineStyle.single.rawValue
       ]
       let attributedText = NSAttributedString(string: "Mais detalhes", attributes: attributes)
       detailsButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    @objc private func advanceAction() {
        delegate?.advanceAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        setConditionsButtonTitle()
    }
    
    func configure(viewModel: EventViewModel?) {
        guard let viewModel = viewModel else { return }
        eventLabel.text = viewModel.title
        eventImage.downloaded(from: viewModel.image, contentMode: .scaleAspectFill)
    }
    
    private func setConstraints() {
        contentView.addSubview(eventImage)
        contentView.addSubview(mainStackView)
        
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            eventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            eventImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            eventImage.widthAnchor.constraint(equalToConstant: 200),
            eventImage.heightAnchor.constraint(equalToConstant: 150),

            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            mainStackView.leadingAnchor.constraint(equalTo: eventImage.trailingAnchor, constant: 12),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            dataLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
}
