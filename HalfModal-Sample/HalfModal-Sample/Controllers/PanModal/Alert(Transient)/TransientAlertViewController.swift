//
//  TransientAlertViewController.swift
//  HalfModal-Sample
//
//  Created by Kazunori Aoki on 2021/10/01.
//

import UIKit
import PanModal

class TransientAlertViewController: AlertViewController {
    
    private weak var timer: Timer?
    private var countdown: Int = 5
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.titleLabel.text = "Transient Alert"
        updateMessage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startTimer()
    }
    
    deinit {
        invalidateTimer()
    }
    
    
    // MARK: PanModalPresentable
    override var showDragIndicator: Bool {
        return false
    }

    override var anchorModalToLongForm: Bool {
        return true
    }

    override var panModalBackgroundColor: UIColor {
        return .clear
    }

    override var isUserInteractionEnabled: Bool {
        return false
    }
}


// MARK: - Private
private extension TransientAlertViewController {
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.countdown -= 1
            self?.updateMessage()
        }
    }
    
    @objc func updateMessage() {
        guard countdown > 0 else {
            invalidateTimer()
            dismiss(animated: true)
            return
        }
        
        alertView.message.text = "MessageDispppears in \(countdown) seconds"
    }
    
    func invalidateTimer() {
        timer?.invalidate()
    }
}
