import UIKit

class BViewController: UIViewController {
    private var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "B"
        view.backgroundColor = .white
        addWatermark(text: "B")
        
        field = addTextField()
        addButton(title: "Save state and go to C", action: #selector(goToC))
    }
    
    @objc func goToC() {
        if let session = Scope.session {
            Store.shared.save(session: session, state: field.text ?? "")
        }
        
        let c = CViewController()
        show(c, sender: self)
    }
}
