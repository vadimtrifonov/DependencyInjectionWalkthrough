import UIKit

// 1. Pass through dependency in C
// 2. Non-testable fetcher and store consumers (view controllers)
// 3. Cannot be modularized

class DViewController: UIViewController {
    private var label: UILabel!
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
        
        title = "D"
        view.backgroundColor = .white
        addWatermark(text: "D")

        label = addLabel()
        
        showSavedState()
    }
    
    func showSavedState() {
        let state = Store.shared.retrieve(session: session)
        label.text = state
    }
}
