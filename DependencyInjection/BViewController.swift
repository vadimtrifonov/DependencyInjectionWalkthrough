import UIKit

public protocol CFactory {
    func makeC() -> UIViewController
}

public class BViewController: UIViewController {
    private var field: UITextField!
    private let store: Store
    private let cFactory: CFactory
    
    public init(store: Store, cFactory: CFactory) {
        self.store = store
        self.cFactory = cFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "B"
        view.backgroundColor = .white
        addWatermark(text: "B")
        
        field = addTextField()
        addButton(title: "Save state and go to C", action: #selector(goToC))
    }
    
    @objc func goToC() {
        store.save(state: field.text ?? "")
        
        let c = cFactory.makeC()
        show(c, sender: self)
    }
}
