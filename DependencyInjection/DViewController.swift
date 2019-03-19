import UIKit
import Store

public class DViewController: UIViewController {
    private var label: UILabel!
    private let store: Store
    
    public init(store: Store) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "D"
        view.backgroundColor = .white
        addWatermark(text: "D")

        label = addLabel()
        
        showSavedState()
    }
    
    func showSavedState() {
        let state = store.retrieve()
        label.text = state
    }
}
