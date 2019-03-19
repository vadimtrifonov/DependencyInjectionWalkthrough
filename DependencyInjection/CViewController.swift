import UIKit

public protocol DFactory {
    func makeD() -> UIViewController
}

public class CViewController: UIViewController {
    private let dFactory: DFactory
    
    public init(dFactory: DFactory) {
        self.dFactory = dFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "C"
        view.backgroundColor = .white
        addWatermark(text: "C")
        
        addButton(title: "Go to D", action: #selector(goToD))
    }
    
    @objc func goToD() {
        let d = dFactory.makeD()
        show(d, sender: self)
    }
}
