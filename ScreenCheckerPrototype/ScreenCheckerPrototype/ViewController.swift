import UIKit

class ViewController: UIViewController {
    
    let callManager = CallManager()
    lazy var providerDelegate = ProviderDelegate(callManager: callManager)
    
    let mainButton = UIButton()
    let callMeButton = UIButton()
    
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
        
        callMeButton.setTitle("Call me", for: .normal)
        callMeButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        callMeButton.bounds.size = CGSize(width: 170, height: 50)
        callMeButton.backgroundColor = .orange
        callMeButton.layer.cornerRadius = 12
        callMeButton.center = view.center
        callMeButton.frame.origin.y += 80
        callMeButton.addTarget(self, action: #selector(callMeButtonTapped), for: .touchUpInside)
        view.addSubview(callMeButton)
    }
    
    @objc func mainButtonTapped() {
//        guard let url = Shortcuts.checkPhoneNumber.url else { return } main Shortcut
        guard let url = Shortcuts.extractorPhoneNumbers.url else { return } // for test
        
        UIApplication.shared.canOpenURL(url)
        ? UIApplication.shared.open(url, options: [:])
        : print("Cannot open URL")
    }
    
    @objc func callMeButtonTapped() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.providerDelegate.reportIncomingCall(uuid: UUID(), handle: "+375336698765", completion: nil)
        }
    }
}

