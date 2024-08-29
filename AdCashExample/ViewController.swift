//
//  ViewController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = "AvatyeAdCash"
    }
    
    @IBAction func nativeAdBtnAction(_ sender: Any) {
        warningLabel.text = "Native 기능은 추후에 업데이트 할 예정입니다."
    }
    
    
}
