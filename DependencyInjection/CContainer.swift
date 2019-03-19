import UIKit
import C

struct CContainer {
    let parent: BContainer
    
    func makeC() -> UIViewController {
        return CViewController(dFactory: self)
    }
}

extension CContainer: DFactory {
    
    func makeD() -> UIViewController {
        return DContainer(parent: self).makeD()
    }
}
