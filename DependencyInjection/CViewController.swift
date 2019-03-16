import UIKit

protocol DFactory {
    func makeD(store: Store) -> UIViewController
}

class CViewController: UIViewController {
    private let store: Store
    private let dFactory: DFactory
    
    init(store: Store, dFactory: DFactory) {
        self.store = store
        self.dFactory = dFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "C"
        view.backgroundColor = .white
        addWatermark(text: "C")
        
        addButton(title: "Go to D", action: #selector(goToD))
    }
    
    @objc func goToD() {
        let d = dFactory.makeD(store: store)
        show(d, sender: self)
    }
}
