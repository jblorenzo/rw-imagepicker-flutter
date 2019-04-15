import UIKit
import Flutter
import Photos

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("rootViewController is not type FlutterViewController")
    }

    let channel = FlutterMethodChannel(name: "/gallery", binaryMessenger: controller)
    channel.setMethodCallHandler { (call, result) in
      switch (call.method) {
      case "getItemCount": result(self.getGalleryImageCount())
      default: result(FlutterError(code: "0", message: nil, details: nil))
      }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func dataForGalleryItem(index: Int, completion: @escaping (Data?, Int, String) -> Void) {
    let fetchOptions = PHFetchOptions()

    let collection: PHFetchResult = PHAsset.fetchAssets(with: fetchOptions)
    if (index >= collection.count) {
      return
    }

    let asset = collection.object(at: index)

    let options = PHImageRequestOptions()
    options.deliveryMode = .fastFormat
    options.isSynchronous = true

    let imageSize = CGSize(width: 250,
                           height: 250)

    let imageManager = PHCachingImageManager()
    imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFit, options: options) { (image, info) in
      if let image = image {
        let data = UIImageJPEGRepresentation(image, 0.9)
        completion(data,
                   Int(asset.creationDate?.timeIntervalSince1970 ?? 0),
                   "\(asset.location ?? CLLocation())")
      } else {
        completion(nil, 0, "")
      }
    }
  }

  func getGalleryImageCount() -> Int {
    let fetchOptions = PHFetchOptions()
    fetchOptions.includeHiddenAssets = true

    let collection: PHFetchResult = PHAsset.fetchAssets(with: fetchOptions)
    return collection.count
  }
}
