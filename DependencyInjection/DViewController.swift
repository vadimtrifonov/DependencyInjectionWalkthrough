import UIKit

// 1. No compile time guarantees for session scope
// 2. Non-testable fetcher and store consumers (view controllers)
// 3. Cannot be modularized

class DViewController: UIViewController {
    private var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "D"
        view.backgroundColor = .white
        addWatermark(text: "D")

        label = addLabel()
        
        showSavedState()
    }
    
    func showSavedState() {
        if let session = Scope.session {
            let state = Store.shared.retrieve(session: session)
            label.text = state
        }
    }
}
