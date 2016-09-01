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
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Swift Implementation"
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
  }
  
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