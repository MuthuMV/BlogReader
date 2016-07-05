//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by Muthu Venkatesh on 5/27/16.
//  Copyright © 2016 Muthu Venkatesh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var webView: UIWebView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let webView = self.webView {
                webView.loadHTMLString(detail.valueForKey("content")!.description, baseURL: NSURL(string: "https://googleblog.blogspot.in/"))
                titleLabel.text = detail.valueForKey("title")!.description
                url.text = detail.valueForKey("url")!.description
                date.text = detail.valueForKey("date")!.description // must convert from NSDate to string
                
//                let dateFormatter = NSDateFormatter()
//                dateFormatter.dateStyle = .MediumStyle
//                dateFormatter.stringFromDate(detail.valueForKey("date")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

