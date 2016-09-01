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
  private var secondPLayer: JWPlayerController!
  
  
  /*
   This setup makes sure we have some scrolling space between the two videos.
   
   What's the issue:
   When the second video has been initialized and we scroll back to the first and go into landscape mode by rotating, the second video is shown, not the first one
   
   Steps to reproduce:
   - start in portrait mode
   
   - play first video for a while
   - pause first video
   
   - scroll to second video
   - play second video for a while
   - pause second video
   
   - scroll back to first video
   - rotate phone into landscape
   */
  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.section == 0 && firstplayer == nil {
      let firstConfig = JWConfig(contentURL: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
      firstplayer = JWPlayerController(config: firstConfig)
      firstVideoContainer.addSubview(firstplayer.view)
      firstplayer.view.frame = firstVideoContainer.bounds
      
      firstplayer.forceFullScreenOnLandscape = true
      firstplayer.forceLandscapeOnFullScreen = true
      
    } else if indexPath.section == 2 && secondPLayer == nil {
      let secondConfig = JWConfig(contentURL: "http://thedigitaltheater.com/wp-content/uploads/2015/08/thx_eclipse_long-1080p_AC3_5.1_thedigitaltheater.mp4")
      secondPLayer = JWPlayerController(config: secondConfig)
      secondVideoContainer.addSubview(secondPLayer.view)
      secondPLayer.view.frame = secondVideoContainer.bounds
      
      secondPLayer.forceFullScreenOnLandscape = true
      secondPLayer.forceLandscapeOnFullScreen = true
    }
  }
}