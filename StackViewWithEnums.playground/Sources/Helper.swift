import UIKit

extension UIView {
    
    public func constrainEqual(attribute: NSLayoutAttribute, to: AnyObject, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constrainEqual(attribute: attribute, to: to, attribute, multiplier: multiplier, constant: constant)
    }
    
    public func constrainEqual(attribute: NSLayoutAttribute, to: AnyObject, _ toAttribute: NSLayoutAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .equal, toItem: to, attribute: toAttribute, multiplier: multiplier, constant: constant)
            ])
    }
    
    public func constrainEdgesToView( _ view: UIView) {
        constrainEqual(attribute: .top, to: view)
        constrainEqual(attribute: .left, to: view)
        constrainEqual(attribute: .bottom, to: view)
        constrainEqual(attribute: .right, to: view)
    }
    
    public func centerIn(_ view: UIView? = nil) {
        guard let container = view ?? self.superview else { fatalError() }
        centerXAnchor.constrainEqual(container.centerXAnchor)
        centerYAnchor.constrainEqual(container.centerYAnchor)
    }
}

extension NSLayoutAnchor {
    public func constrainEqual(_ anchor: NSLayoutAnchor, constant value: CGFloat = 0) {
        let xConstraint = constraint(equalTo: anchor, constant: value)
        xConstraint.isActive = true
    }
}

