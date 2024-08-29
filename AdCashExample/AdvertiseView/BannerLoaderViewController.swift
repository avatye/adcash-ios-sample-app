//
//  BannerAdLoaderController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/27.
//

import UIKit
import AdCashFramework

class BannerLoaderViewController: UIViewController {
    
    @IBOutlet weak var bannerView: UIView!
    let placementId: String = "477b6f40-3295-4984-abf8-be8e6cc06f10"
    
    // MARK: BannerAdView
    var adLoader: BannerAdLoader! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // MARK: - BannerAdView 초기화
        // placementId와 size의 경우, 지면마다 값이 다름
        adLoader = BannerAdLoader(rootVC: self, placementId: placementId, size: .DYNAMIC)
        adLoader.delegate = self
    }
    
    @IBAction func AdLoadBtnAction(_ sender: Any) {
        adLoader.requestAd()
    }
    
    @IBAction func AdRemoveBtnAction(_ sender: Any) {
        adLoader.removeAd()
    }
    
    
}

extension BannerLoaderViewController: BannerAdLoaderDelegate{
    func onBannerRemoved(_ apid: String) {
        print("BannerAdViewController >> onBannerRemoved(\(apid))")
    }
    
    func onBannerLoaded(_ apid: String, adView: UIView, size: CGSize) {
        print("BannerLoaderViewController >> onBannerLoaded(\(apid), ...)")
        // MARK: Layout 설정
        /// -- programatic --
        self.bannerView.addSubview(adView)
        
        adView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // 광고 뷰(adView)의 크기를 광고크기와 같게 지정하고, 위치 지정
            adView.widthAnchor.constraint(equalToConstant: size.width),
            adView.heightAnchor.constraint(equalToConstant: size.height),
            adView.centerXAnchor.constraint(equalTo: self.bannerView.centerXAnchor),
            adView.centerYAnchor.constraint(equalTo: self.bannerView.centerYAnchor)
        ])
    }
    
    func onBannerFailed(_ apid: String, error: AdCashErrorModel) {
        print("BannerLoaderViewController >> onBannerFailed(\(apid), \(error))")
    }
    
    func onBannerClicked(_ apid: String) {
        print("BannerLoaderViewController >> onBannerClicked(\(apid))")
    }
}

