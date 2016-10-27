//
//  PlayerViewController.swift
//  JWPlayerSDKDemo
//
//  Created by Max Mikheyenko on 1/5/15.
//  Copyright (c) 2015 JWPlayer. All rights reserved.


import Foundation
import UIKit
import MediaPlayer

class SwiftPlayerViewController: UITableViewController {
  @IBOutlet weak var firstVideoContainer: UIView!
  @IBOutlet weak var secondVideoContainer: UIView!
  
  private var firstplayer:JWPlayerController!
  private var secondPlayer: JWPlayerController!
  
  
  /*
   What's the issue:
   When you have a bad internet connection (here simulated with network link conditioner in 'Egde' mode) the initializing video blocks the UI.
   
   When you pause XCode at that time and check the debug navigator, you see that synchronous network calls are being made by the JW lib
   
   Steps to reproduce:
   - start app
   - wait for UI to block
   - pause XCode
   - open debug navigator
   
   */
  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.section == 0 && firstplayer == nil {
      let firstConfig = JWConfig(contentURL: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
      firstplayer = JWPlayerController(config: firstConfig)
      firstVideoContainer.addSubview(firstplayer.view)
      firstplayer.view.frame = firstVideoContainer.bounds
      
      firstplayer.forceFullScreenOnLandscape = true
      firstplayer.forceLandscapeOnFullScreen = true
      
    }
//    else if indexPath.section == 2 && secondPlayer == nil {
//      let secondConfig = JWConfig(contentURL: "http://thedigitaltheater.com/wp-content/uploads/2015/08/thx_eclipse_long-1080p_AC3_5.1_thedigitaltheater.mp4")
//      secondPlayer = JWPlayerController(config: secondConfig)
//      secondVideoContainer.addSubview(secondPlayer.view)
//      secondPlayer.view.frame = secondVideoContainer.bounds
//      
//      secondPlayer.forceFullScreenOnLandscape = true
//      secondPlayer.forceLandscapeOnFullScreen = true
//    }
  }
}
