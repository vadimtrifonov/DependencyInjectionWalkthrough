import UIKit

class AViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "A"
        view.backgroundColor = .white
        addWatermark(text: "A")
        
        addButton(title: "Go to B", action: #selector(goToB))
    }
    
    @objc func goToB() {
        let b = BViewController()
        show(b, sender: self)
    }
}
