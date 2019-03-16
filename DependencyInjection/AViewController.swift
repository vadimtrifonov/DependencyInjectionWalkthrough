import UIKit

class AViewController: UIViewController {
    let authGateway: AuthGateway
    
    init(authGateway: AuthGateway) {
        self.authGateway = authGateway
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "A"
        view.backgroundColor = .white
        addWatermark(text: "A")
        
        addButton(title: "Authenticate and go to B", action: #selector(goToB))
    }
    
    @objc func goToB() {
        let session = authGateway.authenticate()
        let store = Store(session: session)

        let b = BViewController(store: store)
        show(b, sender: self)
    }
}
