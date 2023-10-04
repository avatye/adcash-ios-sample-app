//
//  BannerAdLoaderController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/27.
//

import UIKit
import AvatyeAdCash

class BannerLoaderViewController: UIViewController {
    
    // MARK: BannerAdView 초기화
    /// -- banner programatic --
//    private lazy var bannerView: UIView = {
//       let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    /// -- banner with storyboard --
     @IBOutlet weak var bannerView: UIView!
    
    var adLoader: BannerAdLoader! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // placementId와 size의 경우, 지면마다 값이 다름
        adLoader = BannerAdLoader(rootVC: self, placementId: "1a652ca9-8fbb-4b64-b13c-af431319e549", size: .DYNAMIC)
        adLoader.delegate = self
        
        adLoader.requestAd()
    }
}

extension BannerLoaderViewController: BannerAdLoaderDelegate{
    func onBannerLoaded(_ apid: String, adView: UIView, size: CGSize) {
        print("BannerLoaderViewController >> onBannerLoaded(\(apid), ...)")
        // MARK: Layout 설정
        /// -- programatic --
        self.view.addSubview(adView)
        
        adView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // 광고 뷰(adView)의 크기를 광고크기와 같게 지정하고, 위치 지정
            adView.widthAnchor.constraint(equalToConstant: size.width),
            adView.heightAnchor.constraint(equalToConstant: size.height),
            adView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            adView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    func onBannerFailed(_ apid: String, error: AdCashErrorModel) {
        print("BannerLoaderViewController >> onBannerFailed(\(apid), \(error))")
    }
    
    func onBannerClicked(_ apid: String) {
        print("BannerLoaderViewController >> onBannerClicked(\(apid))")
    }
}

