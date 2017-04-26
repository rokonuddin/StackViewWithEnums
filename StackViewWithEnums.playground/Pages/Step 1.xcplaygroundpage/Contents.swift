import UIKit

enum ContentElement {
    case label(String)
    case button(String) // TODO: Add an action
    case image(UIImage)
}

extension ContentElement {
    var view: UIView {
        switch self {
        case .label(let text):
            let label = UILabel()
            label.numberOfLines = 0
            label.text = text
            return label
        case .button(let title):
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            return button
        case .image(let image):
            return UIImageView(image: image)
        }
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        view.addSubview(stack)
        
        stack.constrainEqual(attribute: .width, to: view)
        stack.constrainEqual(attribute: .height, to: view)
        stack.centerIn(view)
        
        let image = #imageLiteral(resourceName: "objc-logo-white")
        let imageView = ContentElement.image(image).view
        imageView.contentMode = .scaleAspectFit
        
        stack.addArrangedSubview(imageView)
        
        let label1 = ContentElement.label("To use the Swift Talk app please login as a subscriber").view
        stack.addArrangedSubview(label1)
        
        let button = ContentElement.button("Login with GitHub").view
        stack.addArrangedSubview(button)
        
        let label2 = ContentElement.label("If you're not registered yet, please visit http://objc.io for more information").view
        stack.addArrangedSubview(label2)
        
    }
}


let vc = ViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
vc.view


