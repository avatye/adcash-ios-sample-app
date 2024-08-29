//
//  BannerViewController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/25.
//

import UIKit
import AdCashFramework

class BannerAdViewController: UIViewController {
    
    let placementId: String = "dbe834db-9c91-4f08-b32d-f4ee46808d51"
    
    // MARK: BannerAdView
    /// -- banner programatic --
//    var bannerView: BannerAdView! = nil
    /// -- banner with storyboard --
    @IBOutlet weak var bannerView: BannerAdView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - BannerAdView 초기화
        // placementId와 size의 경우, 지면마다 값이 다름
        
        /// -- programatic --
//        self.bannerView = BannerAdView(frame: .zero)
        
        self.bannerView.setBannerAd(rootVC: self, placementId: self.placementId, size: .W320XH50)
        self.bannerView.delegate = self
        
        // MARK: Layout 설정
        /// -- programatic --
//        self.view.addSubview(bannerView)
//
//        NSLayoutConstraint.activate([
//            bannerView.heightAnchor.constraint(equalToConstant: 50),
//            bannerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            bannerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            bannerView.widthAnchor.constraint(equalToConstant: 320)
//        ])
        /// -- storyboard --
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    @IBAction func adLoadBtnAction(_ sender: Any) {
        // MARK: 광고 호출
        bannerView.requestAd()
    }
    
    @IBAction func adRemoveBtnAction(_ sender: Any) {
        bannerView.removeAd()
    }
    
    
}

// MARK: Delegation
extension BannerAdViewController: BannerAdWidgetDelegate {
    func onBannerRemoved(_ apid: String) {
        print("BannerAdViewController >> onBannerRemoved(\(apid))")
    }
    
    func onBannerLoaded(_ apid: String) {
        print("BannerAdViewController >> onBannerLoaded(\(apid))")
    }
    
    func onBannerFailed(_ apid: String, error: AdCashErrorModel) {
        print("BannerAdViewController >> onBannerFailed(\(apid), \(error))")
    }
    
    func onBannerClicked(_ apid: String) {
        print("BannerAdViewController >> onBannerClicked(\(apid))")
    }
}
