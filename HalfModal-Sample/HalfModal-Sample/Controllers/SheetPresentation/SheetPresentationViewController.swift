//
//  SheetPresentationViewController.swift
//  HalfModal-Sample
//
//  Created by kazunori.aoki on 2021/10/05.
//

import UIKit
import PhotosUI

class SheetPresentationViewController: UIViewController {
    
    // MARK: UI
    private let button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
                
        button.setTitle("Half Modal", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()

    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}


// MARK: - Setup
private extension SheetPresentationViewController {
    
    func setup() {
                
        view.addSubview(button)
        button.center = view.center
        
        button.addAction(.init { [unowned self] _ in
            self.showSheet()
        }, for: .touchUpInside)
    }
}


// MARK: - Private
private extension SheetPresentationViewController {
    
    @available(iOS 15.0, *)
    @objc func showSheet() {
        let configure = PHPickerConfiguration()
        let picker = PHPickerViewController(configuration: configure)
        picker.delegate = self
        
        if let sheet = picker.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false // Sheetのサイズを変更できるようにする
        }
        
        present(picker, animated: true)
    }
}


// MARK: - PHPickerViewControllerDelegate
extension SheetPresentationViewController: PHPickerViewControllerDelegate {
    
    @available(iOS 15.0, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        print(results)
        
        if let sheet = picker.sheetPresentationController {
            sheet.animateChanges {
                sheet.selectedDetentIdentifier = .medium
            }
        }
    }
}
