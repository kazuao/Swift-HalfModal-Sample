//
//  BasicViewController.swift
//  HalfModal-Sample
//
//  Created by Kazunori Aoki on 2021/10/01.
//

import UIKit
import PanModal

final class BasicViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    }
}


extension BasicViewController: PanModalPresentable {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(200)
    }
    
    var anchorModalToLongForm: Bool {
        return false
    }
}
