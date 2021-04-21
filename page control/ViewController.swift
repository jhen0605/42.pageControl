//
//  ViewController.swift
//  page control
//
//  Created by 簡吟真 on 2021/4/21.
//  Jhen🐯

import UIKit
import AVFoundation


let famousImages = ["貝多芬.png", "莫札特.JPG", "蕭邦.JPG"]
let famousLabels = ["樂聖", "音樂神童", "浪漫主義鋼琴詩人"]
let famousNames = ["貝多芬", "莫札特", "蕭邦"]
let pageNumberLabels = ["1", "2", "3"]

var selectIndex: Int = 0

class ViewController: UIViewController {
    
    //音樂
    let player = AVPlayer()

    //IBO
    @IBOutlet weak var famousImage: UIImageView!
    @IBOutlet weak var famousLabel: UILabel!
    @IBOutlet weak var famousName: UILabel!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //背景音樂設定
        let fileUrl = Bundle.main.url(forResource: "Für Elise", withExtension: "mp3")!
                let playerItem = AVPlayerItem(url: fileUrl)
                player.replaceCurrentItem(with: playerItem)
                player.play()
        
        
        famousImage.layer.cornerRadius = 60
        famousImage.clipsToBounds = true
        famousLabel.text = famousLabels[0]
        famousName.text = famousNames[0]
        pageLabel.text = pageNumberLabels[0]
    }
    
    
    //定義
    func record() {
        famousImage.image = UIImage(named: famousImages[selectIndex])
        famousLabel.text = famousLabels[selectIndex]
        famousName.text = famousNames[selectIndex]
        pageLabel.text = pageNumberLabels[selectIndex]
        page.currentPage = selectIndex
        segment.selectedSegmentIndex = selectIndex
    }

   //button上一張
    @IBAction func previousButton(_ sender: UIButton) {
        selectIndex -= 1
        if selectIndex == 1 {
            record()
        } else if selectIndex == 1 {
            record()
        } else if selectIndex == 0 {
            record()
        } else {
            selectIndex = 2
            record()
        }
    }
    
    //button下一張
    @IBAction func nextButton(_ sender: Any) {
        selectIndex += 1
        if selectIndex == 0 {
            record()
        } else if selectIndex == 1 {
            record()
        } else if selectIndex == 2 {
            record()
        } else {
            selectIndex = 0
            record()
        }

    }
    
    //頁數圓點
    @IBAction func alterPage(_ sender: UIPageControl) {
        selectIndex = sender.currentPage
        if page.currentPage == 0 {
            selectIndex = 0
            record()
        } else if page.currentPage == 1 {
            selectIndex = 1
            record()
        } else {
            selectIndex = 2
            record()
        }
    }
    
    //分頁選項
    @IBAction func alterSegment(_ sender: UISegmentedControl) {
        selectIndex = sender.selectedSegmentIndex
        if segment.selectedSegmentIndex == 0 {
            selectIndex = 0
            record()
        } else if segment.selectedSegmentIndex == 1 {
            selectIndex = 1
            record()
        } else {
            selectIndex = 2
            record()
        }
    }
    
    //手勢-照片左右滑動
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .left {
            selectIndex += 1
            if selectIndex == 0 {
                record()
            } else if selectIndex == 1 {
                record()
            } else if selectIndex == 2 {
                record()
            } else {
                selectIndex = 0
                record()
            }
        } else if sender.direction == .right {
            selectIndex -= 1
            if selectIndex == 2 {
                record()
            } else if selectIndex == 1 {
                record()
            } else if selectIndex == 0 {
                record()
            } else {
                selectIndex = 2
                record()
            }
        }
    }
}

