import UIKit
import AppIntents

class ViewController: UIViewController {
    let mainButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
    }
    
    func configureButton() {
        mainButton.setImage(UIImage(named: "eatOne"), for: .normal)
        mainButton.bounds.size = CGSize(width: 100, height: 100)
        mainButton.center = view.center
        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        
        view.addSubview(mainButton)
    }
    
    @objc func mainButtonTapped() {
        if let url = URL(string: "https://www.icloud.com/shortcuts/6b0c322094d84f30bc2765e1f46471f3") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            } else {
                print("Cannot open URL")
            }
        }
    }
}

