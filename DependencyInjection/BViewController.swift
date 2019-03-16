import UIKit

class BViewController: UIViewController {
    private var field: UITextField!
    private let store: Store
    
    init(store: Store) {
        self.store = store
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
        store.save(state: field.text ?? "")
        
        let c = CViewController(store: store)
        show(c, sender: self)
    }
}
