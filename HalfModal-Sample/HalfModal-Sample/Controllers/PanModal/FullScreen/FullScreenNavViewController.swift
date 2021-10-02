//
//  FullScreenNavViewController.swift
//  HalfModal-Sample
//
//  Created by Kazunori Aoki on 2021/10/01.
//

import UIKit
import PanModal

class FullScreenNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        pushViewController(FullScreenViewController(), animated: true)
    }
}


extension FullScreenNavViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }

    var topOffset: CGFloat {
        return 0.0
    }

    var springDamping: CGFloat {
        return 1.0
    }

    var transitionDuration: Double {
        return 0.4
    }

    var transitionAnimationOptions: UIView.AnimationOptions {
        return [.allowUserInteraction, .beginFromCurrentState]
    }

    var shouldRoundTopCorners: Bool {
        return false
    }

    var showDragIndicator: Bool {
        return false
    }
}


private class FullScreenViewController: UIViewController {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Drag downwards to dismiss"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
