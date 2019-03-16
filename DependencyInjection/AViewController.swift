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
        Scope.session = session
        
        let b = BViewController()
        show(b, sender: self)
    }
}
