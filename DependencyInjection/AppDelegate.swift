import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow()
        window.rootViewController = Container().makeA()
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

struct Container: BFactory, CFactory, DFactory {
    
    func makeA() -> UIViewController {
        let authGateway = AuthGateway()
        let a = AViewController(authGateway: authGateway, bFactory: self)
        return UINavigationController(rootViewController: a)
    }
    
    func makeB(session: Session) -> UIViewController {
        let store = Store(session: session)
        return BViewController(store: store, cFactory: self)
    }

    func makeC(store: Store) -> UIViewController {
        return CViewController(store: store, dFactory: self)
    }

    func makeD(store: Store) -> UIViewController {
        return DViewController(store: store)
    }
}
