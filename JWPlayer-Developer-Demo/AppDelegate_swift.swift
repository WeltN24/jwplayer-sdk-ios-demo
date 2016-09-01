//
//  AppDelegate_swift.swift
//  JWPlayer-Developer-Guide
//
//  Created by Felix Dietz on 01/09/16.
//  Copyright © 2016 JWPlayer. All rights reserved.
//

import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  /*
   This method is overridden to make it more similar to our app.
   Because our app is portrait mode only we had to hack this in order to enable fullscreen for videos.
   A side effect to this is, that when no video is in the viewport, when rotating the device, the status bar still rotates but the rest stays in portrait
   
   
   
   It is actually not needed to override this method to produce the other issue, so feel free to comment this method and enable all orientations in the target if needed
   */
  func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> UIInterfaceOrientationMask {
    guard let topController = window?.topController() else {
      return application.supportedInterfaceOrientationsForWindow(window)
    }
    
    // Another thing we noticed is that with every new player you create another UIWindow and these accumulate with several players on the same page
    print("\n\n\(window)")
    
    let className = NSStringFromClass(topController.dynamicType)
    
    if className.lowercaseString == "jwfullscreenviewcontroller" {
      
      return .AllButUpsideDown
    }
    return application.supportedInterfaceOrientationsForWindow(window)
  }
}

public extension UIWindow {
  /**
   Depicts the topmost view controller by recursively getting the presentedViewController in the hierarchy.
   
   - returns: The topmost view controller
   */
  func topController() -> UIViewController? {
    var result = self.rootViewController
    
    while let presentedViewController = result?.presentedViewController {
      result = presentedViewController
    }
    
    return result
  }
}