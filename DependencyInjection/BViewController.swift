import UIKit

class BViewController: UIViewController {
    private var field: UITextField!
    private let session: Session
    
    init(session: Session) {
        self.session = session
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "B"
        view.backgroundColor = .white
        addWatermark(text: "B")
        
        field = addTextField()
        addButton(title: "Save state and go to C", action: #selector(goToC))
    }
    
    @objc func goToC() {
        Store.shared.save(session: session, state: field.text ?? "")
        
        let c = CViewController(session: session)
        show(c, sender: self)
    }
}
