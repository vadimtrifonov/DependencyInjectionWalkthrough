import UIKit

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

struct AContainer {
    
    func makeA() -> UIViewController {
        let authGateway = DefaultAuthGateway()
        let a = AViewController(authGateway: authGateway, bFactory: BContainer())
        return UINavigationController(rootViewController: a)
    }
}

struct BContainer: BFactory {
    
    func makeB(session: Session) -> UIViewController {
        let store = DefaultStore(session: session)
        return BViewController(store: store, cFactory: CContainer())
    }
}

struct CContainer: CFactory {
    
    func makeC(store: Store) -> UIViewController {
        return CViewController(store: store, dFactory: DContainer())
    }
}

struct DContainer: DFactory {
    
    func makeD(store: Store) -> UIViewController {
        return DViewController(store: store)
    }
}
