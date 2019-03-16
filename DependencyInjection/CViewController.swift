import UIKit

class CViewController: UIViewController {
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
        
        title = "C"
        view.backgroundColor = .white
        addWatermark(text: "C")
        
        addButton(title: "Go to D", action: #selector(goToD))
    }
    
    @objc func goToD() {
        let d = DViewController(store: store)
        show(d, sender: self)
    }
}
