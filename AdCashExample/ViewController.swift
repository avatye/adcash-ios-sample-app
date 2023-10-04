//
//  ViewController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/25.
//

import AvatyeAdCash
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = "AvatyeAdCash"
//        setupButtons()
    }
    
    func setupButtons() {
        let titles = ["First VC", "Second VC", "thrid vc"]
            
        for (index, title) in titles.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
                
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(index * 40) - 80)
            ])
        }
    }

    @objc func buttonTapped(_ sender: UIButton) {
        var viewController: UIViewController?
        
        switch sender.tag {
        case 0:
            viewController = BannerAdViewController()
        case 1:
            viewController = BannerLoaderViewController()
        case 2:
            let storyboard = UIStoryboard(name: "NativeAdStoryBoard", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "NativeAdViewController") as? NativeAdViewController
//        case 3:
//            viewController = BannerViewController()
//        case 4:
//            viewController = BannerViewController()
        default:
            break
        }
        
        if let vc = viewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
