//
//  InterstitialAdViewController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/10/04.
//

import UIKit
import AdCashFramework

class InterstitialAdViewController: UIViewController {
    let placementID: String = "759c863a-6662-498d-a478-d16cbe79d38e"
    
    private var interAdView: InterstitialAdLoader! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interAdView = InterstitialAdLoader(placementId: placementID, rootViewController: self)
        
        self.interAdView.delegate = self
    }
    
    @IBAction func loadBtnAction(_ sender: Any) {
        print("123312312123")
        self.interAdView.requestAd()
    }
    
    
}

extension InterstitialAdViewController: InterstitialAdDelegate{
    func onInterstitalLoaded(_ apid: String) {
        print("InterstitialAdViewController >> onInterstitalLoaded(\(apid))")
    }
    
    func onInterstitalOpened(_ apid: String) {
        print("InterstitialAdViewController >> onInterstitalOpened(\(apid))")
    }
    
    func onInterstitalClosed(_ apid: String, isCompleted: Bool) {
        print("InterstitialAdViewController >> onInterstitalClosed(\(apid), \(isCompleted))")
    }
    
    func onInterstitalFailed(_ apid: String, error: AdCashErrorModel) {
        print("InterstitialAdViewController >> onInterstitalFailed(\(apid), \(error))")
    }
    
    func onInterstitalClicked(_ apid: String) {
        print("InterstitialAdViewController >> onInterstitalClicked(\(apid))")
    }
    
}
