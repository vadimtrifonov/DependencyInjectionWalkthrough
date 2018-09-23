import UIKit

class BViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "B"
        view.backgroundColor = .white
        addWatermark(text: "B")
        
        addButton(title: "Go to C", action: #selector(goToC))
    }
    
    @objc func goToC() {
        let c = CViewController()
        show(c, sender: self)
    }
}
