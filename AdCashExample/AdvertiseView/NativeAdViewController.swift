//
//  NativeAdLoaderController.swift
//  AdCashExample
//
//  Created by 박상준 on 2023/09/27.
//

import UIKit
import AdCashFramework

class NativeAdViewController: UIViewController{
    
    // MARK: NativeAd 초기화
    /// -- programmatic --
//    private lazy var adIcon: UIImageView = {
//       let icon = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        return icon
//    }()
//
//    private lazy var adTitle: UILabel = UILabel()
//
//    private lazy var adDescription: UILabel = UILabel()
//
//    private lazy var adMainImage: UIImageView = UIImageView()
//
//    private lazy var adAdaptor: AdPopAdapter = {
//       let adapter = AdPopAdapter(frame: CGRect(x: 10, y: 10, width: 280, height: 300))
//        return adapter
//    }()
//
//    private lazy var adContainer: AdCashDefault = {
//        let view = AdCashDefault(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//        return view
//    }()
    
    /// -- with storyboard --
    @IBOutlet weak var adIcon: UIImageView!
    @IBOutlet weak var adTitle: UILabel!
    @IBOutlet weak var adDescription: UILabel!
    @IBOutlet weak var adMainImage: UIImageView!
    @IBOutlet weak var adAdaptor: AdPopAdapter!

    @IBOutlet weak var adContainer: AdCashDefault!
    
    var nativeLoader: NativeAdLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // MARK: Layout
        /// -- programatic --
//        self.view.addSubview(adContainer)
//        self.adContainer.addSubview(adAdaptor)
//        self.adAdaptor.addSubview(adIcon)
//        self.adAdaptor.addSubview(adTitle)
//        self.adAdaptor.addSubview(adDescription)
//        self.adAdaptor.addSubview(adMainImage)
//        adTitle.frame = CGRect(x: 0, y: 60, width: 250, height: 30)
//        adDescription.frame = CGRect(x: 0, y: 100, width: 250, height: 30)
//        adMainImage.frame = CGRect(x: 0, y: 140, width: 250, height: 130)
        
        // placementId의 경우, 지면마다 값이 다름
        nativeLoader = NativeAdLoader(rootVC: self, placementId: "d7726db6-d4a8-4629-b8e8-b8ebf9a96faa", nativeAd: adContainer)
        
        adAdaptor.setDesc(adDescription)
            .setIcon(adIcon)
            .setTitle(adTitle)
            .setMainImage(adMainImage)
        
        nativeLoader.setNativeAd(adPopAdapter: adAdaptor)
        
        // 미디에이션으로 GAM, NAM을 추가하는경우 각각 추가
        nativeLoader.setGAMNativeAd(xibNamed: "MGAMNativeAdView")
        nativeLoader.setNAMNativeAd(xibNamed: "GFPNativeSimpleAdView")
        
        nativeLoader.delegate = self
        
        nativeLoader.requestAd()
    }
}

extension NativeAdViewController: NativeAdLoaderDelegate{
    func onNativeLoaded(_ apid: String, adView: UIView) {
        print("NativeAdLoaderController >> onNativeLoaded(\(apid))")
    }
    
    func onNativeFailed(_ apid: String, error: AdCashErrorModel) {
        print("NativeAdLoaderController >> onNativeFailed(\(apid), \(error))")
    }
    
    func onNativeClicked(_ apid: String) {
        print("NativeAdLoaderController >> onNativeClicked(\(apid))")
    }
    
    
}
