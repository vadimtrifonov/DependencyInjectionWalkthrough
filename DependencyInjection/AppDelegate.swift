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

struct AContainer: BFactory {
    
    func makeA() -> UIViewController {
        let authGateway = DefaultAuthGateway()
        let a = AViewController(authGateway: authGateway, bFactory: self)
        return UINavigationController(rootViewController: a)
    }
    
    func makeB(session: Session) -> UIViewController {
        return BContainer().makeB(session: session)
    }
}

struct BContainer: CFactory {
    
    func makeB(session: Session) -> UIViewController {
        let store = DefaultStore(session: session)
        return BViewController(store: store, cFactory: self)
    }
    
    func makeC(store: Store) -> UIViewController {
        return CContainer().makeC(store: store)
    }
}

struct CContainer: DFactory {
    
    func makeC(store: Store) -> UIViewController {
        return CViewController(store: store, dFactory: self)
    }
    
    func makeD(store: Store) -> UIViewController {
        return DContainer().makeD(store: store)
    }
}

struct DContainer {
    
    func makeD(store: Store) -> UIViewController {
        return DViewController(store: store)
    }
}
