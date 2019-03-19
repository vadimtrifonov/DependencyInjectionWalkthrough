import UIKit
import Auth
import A

struct AContainer {
    let authGateway = DefaultAuthGateway()
    
    func makeA() -> UIViewController {
        let a = AViewController(authGateway: authGateway, bFactory: self)
        return UINavigationController(rootViewController: a)
    }
}

extension AContainer: BFactory {
    
    func makeB(session: Session) -> UIViewController {
        return BContainer(parent: self, session: session).makeB()
    }
}
