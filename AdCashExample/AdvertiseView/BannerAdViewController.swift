//
//  BannerViewController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/25.
//

import AvatyeAdCash
import UIKit

class BannerAdViewController: UIViewController {
    // MARK: BannerAdView 초기화
    /// -- banner programatic --
//    let bannerView: BannerAdView = {
//        let ad = BannerAdView()
//        ad.translatesAutoresizingMaskIntoConstraints = false
//        return ad
//    }()
    /// -- banner with storyboard --
    @IBOutlet weak var bannerView: BannerAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .white
        
        // placementId와 size의 경우, 지면마다 값이 다름
        bannerView.setBannerAd(rootVC: self, placementId: "8e9315c6-f96f-442c-a15f-a0126b861f2e", size: .W320XH50)
        bannerView.delegate = self
        
        // MARK: Layout 설정
        /// -- programatic --
//        self.view.addSubview(bannerView)
//
//        NSLayoutConstraint.activate([
//            bannerView.heightAnchor.constraint(equalToConstant: 50),
//            bannerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            bannerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            bannerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//        ])
        /// -- storyboard --
        /// Dynamic Size의 경우, 가이드 참조 (https://avatye.readme.io/docs/adcash-ios-banner#dynamic-type%EC%9D%98-layout-%EA%B0%80%EC%9D%B4%EB%93%9C)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        bannerView.removeAd()
        // MARK: 광고 호출
        bannerView.requestAd()
    }
}

// MARK: Delegation
extension BannerAdViewController: BannerAdWidgetDelegate {
    func onBannerLoaded(_ apid: String) {
        print("BannerAdViewController >> onBannerLoaded(\(apid))")
        self.view.bringSubviewToFront(bannerView)
    }
    
    func onBannerFailed(_ apid: String, error: AdCashErrorModel) {
        print("BannerAdViewController >> onBannerFailed(\(apid), \(error))")
    }
    
    func onBannerClicked(_ apid: String) {
        print("BannerAdViewController >> onBannerClicked(\(apid))")
    }
}
