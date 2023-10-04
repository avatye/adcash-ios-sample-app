//
//  InterstitialAdViewController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/10/04.
//

import UIKit
import AvatyeAdCash

class InterstitialAdViewController: UIViewController {
    private var interAdView: InterstitialAdLoader! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interAdView = InterstitialAdLoader(placementId: "fd5ce473-d3bb-4f10-818d-775cec39302a")
        
        addChild(self.interAdView)
        
        self.interAdView.delegate = self
        
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
