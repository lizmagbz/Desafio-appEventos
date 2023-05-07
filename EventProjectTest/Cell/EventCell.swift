//
//  EventCell.swift
//  EventProjectTest
//
//  Created by Liz Mabel Gomes on 03/05/23.
//

import UIKit

protocol EventCellDelegate: AnyObject {
    func clickAction()
}

class EventCell: UITableViewCell {
    
    weak var delegate: EventCellDelegate?
    
    static let identifier: String = "EventCell"
    
    private lazy var eventImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "events")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.text = "High School Music"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var detailsButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .clear
        button.addTarget (self, action: #selector (clickAction), for: .touchUpInside)
        return button
    }()
    
    private func setConditionsButtonTitle() {
       detailsButton.backgroundColor = .clear
       let attributes: [NSAttributedString.Key: Any] = [
          .foregroundColor: UIColor.systemGray,
          .font: UIFont.systemFont(ofSize: 16, weight: .regular),
          .underlineStyle: NSUnderlineStyle.single.rawValue
       ]
       let attributedText = NSAttributedString(string: "Mais detalhes", attributes: attributes)
       detailsButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    @objc private func clickAction() {
        delegate?.clickAction()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        setConditionsButtonTitle()
    }
    
    private func setConstraints() {
        contentView.addSubview(eventImage)
        contentView.addSubview(eventLabel)
        contentView.addSubview(detailsButton)
        
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            eventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            eventImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            eventImage.widthAnchor.constraint(equalToConstant: 150),
            eventImage.heightAnchor.constraint(equalToConstant: 150),
            
            eventLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            eventLabel.leadingAnchor.constraint(equalTo: eventImage.trailingAnchor, constant: 16),
            eventLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            detailsButton.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 16),
            detailsButton.leadingAnchor.constraint(equalTo: eventImage.trailingAnchor, constant: 8),
            detailsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            detailsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
        ])
    }
}
