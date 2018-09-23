import UIKit

class CViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "C"
        view.backgroundColor = .white
        addWatermark(text: "C")
        
        addButton(title: "Go to D", action: #selector(goToD))
    }
    
    @objc func goToD() {
        let d = DViewController()
        show(d, sender: self)
    }
}
