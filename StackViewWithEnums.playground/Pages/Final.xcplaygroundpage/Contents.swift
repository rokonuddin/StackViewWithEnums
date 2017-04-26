import UIKit

final class CallBackButton: UIView {
    let onTap: () -> ()
    let button: UIButton
    
    init(title: String, onTap: @escaping () -> ()) {
        self.onTap = onTap
        self.button = UIButton(type: .system)
        super.init(frame: .zero)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.constrainEdgesToView(self)
        button.addTarget(self, action: #selector(tapped(_ :)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapped(_ sender: UIButton) {
        onTap()
    }
}

enum ContentElement {
    case label(String)
    case button(String, () -> ())
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
        case .button(let title, let callback):
            return CallBackButton(title: title, onTap: callback)
        case .image(let image):
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            return UIImageView(image: image)
        }
    }
}

extension UIStackView {
    convenience init(elements: [ContentElement]) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 10
        
        for element in elements {
            addArrangedSubview(element.view)
        }
    }
}

class StackViewController: UIViewController {
    
    let elements: [ContentElement]
    
    init(elements: [ContentElement]) {
        self.elements = elements
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stack = UIStackView(elements: elements)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        view.addSubview(stack)
        stack.constrainEqual(attribute: .height, to: view)
        stack.constrainEqual(attribute: .width, to: view)
        stack.centerIn(view)
        
    }
}

let elements: [ContentElement] = [
    .image(#imageLiteral(resourceName: "objc-logo-white.png")),
    .label("To use the Swift Talk app please login as a subscriber"),
    .button("Login with GitHub", {
        print("Button tapped")
    }),
    .label("If you're not registered yet, please visit http://objc.io for more information")
]

let vc = StackViewController(elements: elements)
vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
vc.view




