import UIKit

protocol DescriptionDetailsCellDelegate: AnyObject {
    func checkAction()
    func shareAction()
}

class DescriptionDetailsCell: UITableViewCell {
    
    weak var delegate: DescriptionDetailsCellDelegate?
    static let identifier: String = "DescriptionDetailsCell"
    
    private lazy var eventImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "FeiraDeAnimais")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            eventTitleLabel,
            dataLabel,
        ])
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var eventTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Feira de adoção de animais na Redenção"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.text = "18/11/2023"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda!\n\nNa ocasião, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            checkInButton,
            shareButton
        ])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        return stackView
    }()
    
    lazy var checkInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Check-in", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGray5
        button.addTarget (self, action: #selector (checkAction), for: .touchUpInside)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Compartilhar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGray5
        button.addTarget (self, action: #selector (shareAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func checkAction() {
        delegate?.checkAction()
    }
    
    @objc private func shareAction() {
        delegate?.shareAction()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setConstraints()
    }
    
    private func setConstraints() {
        contentView.addSubview(eventImage)
        contentView.addSubview(mainStackView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buttonStackView)
        
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            eventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            eventImage.widthAnchor.constraint(equalToConstant: 350),
            eventImage.heightAnchor.constraint(equalToConstant: 250),
            
            mainStackView.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            descriptionLabel.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 14),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            buttonStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            buttonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),

            checkInButton.widthAnchor.constraint(equalToConstant: 335),
            checkInButton.heightAnchor.constraint(equalToConstant: 40),

            shareButton.widthAnchor.constraint(equalToConstant: 335),
            shareButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
