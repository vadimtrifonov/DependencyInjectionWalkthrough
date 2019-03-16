import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow()
        
        let authGateway = AuthGateway()
        let a = AViewController(authGateway: authGateway)
        let navigationController = UINavigationController(rootViewController: a)
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
