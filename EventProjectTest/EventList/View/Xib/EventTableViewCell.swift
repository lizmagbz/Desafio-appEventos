import UIKit

protocol EventListCellDelegate: AnyObject {
    func advanceAction(viewModel: EventViewModel)
}

class EventTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    var viewModel: EventViewModel?
    weak var delegate: EventListCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(viewModel: EventViewModel?) {
        self.viewModel = viewModel
        guard let viewModel = viewModel else { return }
        eventLabel.text = viewModel.title
        dataLabel.text = viewModel.date
        eventImage.downloaded(from: viewModel.image, contentMode: .scaleAspectFill)
        
        eventImage.layer.borderWidth = 2.0
        eventImage.layer.borderColor = UIColor.lightGray.cgColor
        eventImage.layer.cornerRadius = 10.0
    }
    
    @IBAction func advanceAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        delegate?.advanceAction(viewModel: viewModel)
    }
}
