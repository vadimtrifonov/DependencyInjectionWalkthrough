import UIKit
import Store
import D

struct DContainer {
    let parent: CContainer
    
    func makeD() -> UIViewController {
        let store = parent.parent.store
        return DViewController(store: store)
    }
}
