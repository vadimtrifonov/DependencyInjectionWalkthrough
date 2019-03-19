import UIKit
import Store
import Auth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow()
        window.rootViewController = AContainer().makeA()
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

struct AContainer: BFactory {
    let authGateway = DefaultAuthGateway()
    
    func makeA() -> UIViewController {
        let a = AViewController(authGateway: authGateway, bFactory: self)
        return UINavigationController(rootViewController: a)
    }
    
    func makeB(session: Session) -> UIViewController {
        return BContainer(parent: self, session: session).makeB()
    }
}

struct BContainer: CFactory {
    let parent: AContainer
    let store: Store
    
    init(parent: AContainer, session: Session) {
        self.parent = parent
        self.store = DefaultStore(session: session)
    }
    
    func makeB() -> UIViewController {
        return BViewController(store: store, cFactory: self)
    }
    
    func makeC() -> UIViewController {
        return CContainer(parent: self).makeC()
    }
}

struct CContainer: DFactory {
    let parent: BContainer
    
    func makeC() -> UIViewController {
        return CViewController(dFactory: self)
    }
    
    func makeD() -> UIViewController {
        return DContainer(parent: self).makeD()
    }
}

struct DContainer {
    let parent: CContainer
    
    func makeD() -> UIViewController {
        let store = parent.parent.store
        return DViewController(store: store)
    }
}
