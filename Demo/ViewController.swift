import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AsyncAnimation(_ sender: Any) {
        getAnimation().async()
    }
    
    @IBAction func syncAnimation(_ sender: Any) {
        getAnimation().sync()
    }
    
    func getAnimation() -> Animator {
        return
            animate { self.squareView.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0) }
                .then { self.squareView.transform = CGAffineTransform.identity }
                .duration(1)
                .then { self.squareView.alpha = 0.5 }
                .duration(2)
                .then { self.squareView.alpha = 1 }
                .delay(0.4)
                .then { self.squareView.backgroundColor = UIColor.red }
                .duration(0.8)
                .delay(0.2)
                .completion { _ in self.squareView.backgroundColor = UIColor.green }
    }
}

