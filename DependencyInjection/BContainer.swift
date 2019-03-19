import UIKit
import Auth
import Store
import B

struct BContainer {
    let parent: AContainer
    let store: Store
    
    init(parent: AContainer, session: Session) {
        self.parent = parent
        self.store = DefaultStore(session: session)
    }
    
    func makeB() -> UIViewController {
        return BViewController(store: store, cFactory: self)
    }
}

extension BContainer: CFactory {
    
    func makeC() -> UIViewController {
        return CContainer(parent: self).makeC()
    }
}
