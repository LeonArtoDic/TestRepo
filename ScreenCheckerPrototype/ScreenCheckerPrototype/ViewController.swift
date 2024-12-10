import UIKit

class ViewController: UIViewController {
    let mainButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
    }
    
    func configureButton() {
        mainButton.setTitle("Add shortcut", for: .normal)
        mainButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        mainButton.bounds.size = CGSize(width: 200, height: 60)
        mainButton.backgroundColor = .blue
        mainButton.layer.cornerRadius = 12
        mainButton.center = view.center
        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        view.addSubview(mainButton)
    }
    
    @objc func mainButtonTapped() {
        guard let url = Shortcuts.checkPhoneNumber.url else { return }
        
        UIApplication.shared.canOpenURL(url)
        ? UIApplication.shared.open(url, options: [:])
        : print("Cannot open URL")
    }
}

