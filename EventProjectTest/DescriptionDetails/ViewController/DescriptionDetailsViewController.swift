import UIKit

class DescriptionDetailsViewController: UIViewController {
    
    var viewDetails = DescriptionDetailsView()
    var eventViewModel: EventViewModel
    
    init(eventViewModel: EventViewModel) {
        self.eventViewModel = eventViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetails.delegate = self
        viewDetails.configure(viewModel: eventViewModel)
        navigationController?.navigationBar.tintColor = UIColor.black
        
        view = viewDetails
    }
}

extension DescriptionDetailsViewController: DetailsViewDelegate {
    func checkAction() {
        makePOSTRequest(viewModel: eventViewModel) { result in
            DispatchQueue.main.async {
                if result?.code == "200" {
                    let subscriptionViewController = SubscriptionViewController()
                    self.navigationController?.pushViewController(subscriptionViewController, animated: true)
                    
                } else {
                    let alertController = UIAlertController(title: "Erro", message: "Não foi possível realizar a sua inscrição no evento", preferredStyle: .actionSheet)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

func shareAction() {
    let items:[Any] = [eventViewModel.image, eventViewModel.title, eventViewModel.description]
    let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
    self.present(ac, animated: true)
    
 }
}

