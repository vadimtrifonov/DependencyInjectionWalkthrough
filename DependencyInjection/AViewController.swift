import UIKit

class AViewController: UIViewController {
    let authGateway = AuthGateway()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "A"
        view.backgroundColor = .white
        addWatermark(text: "A")
        
        addButton(title: "Authenticate and go to B", action: #selector(goToB))
    }
    
    @objc func goToB() {
        let session = authGateway.authenticate()
        
        let b = BViewController(session: session)
        show(b, sender: self)
    }
}
