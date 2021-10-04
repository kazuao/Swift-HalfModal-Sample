//
//  ViewController.swift
//  HalfModal-Sample
//
//  Created by Kazunori Aoki on 2021/10/01.
//

import UIKit

class ViewController: UIViewController {

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: - IBAction
extension ViewController {
    
    @IBAction func tapFloatingPanelButton(_ sender: Any) {
        let sb = UIStoryboard(name: StoryboardID.floatingPanel.rawValue, bundle: nil)
        if let vc = sb.instantiateInitialViewController() as? FloatingPanelViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func tapPanModalButton(_ sender: Any) {
        let vc = PanModalViewController()
        navigationController?.pushViewController(vc, animated: true)        
    }
    
    @IBAction func tapSelfButton(_ sender: Any) {
        let vc = SheetPresentationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController {
    
    
}
