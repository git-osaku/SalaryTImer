//
//  ViewController.swift
//  SaralyTimer
//
//  Created by sakuda-ryo on 2015/06/02.
//  Copyright (c) 2015年 myname. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var annualSalary = 3000000
    
    var days = 22
    
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var salaryLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerDidFire", userInfo: nil, repeats: true)
        
        
    }

    
    func timerDidFire() {
        
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        let string = formatter.stringFromDate(now)
        
        formatter.dateFormat = "yyyy"
        let year = formatter.stringFromDate(now)
        
        
        formatter.dateFormat = "MM"
        let month = formatter.stringFromDate(now)
        
        
        formatter.dateFormat = "dd"
        let day = formatter.stringFromDate(now)
        
//        NSDate *dateNow = [NSDate date];
//        //スタートさせた時間（startDate)から現在の時間（dateNow）を引いた時間をテキストに表示。
//        _timeTextLabel.text = [NSString stringWithFormat:@"%.2f",[dateNow timeIntervalSinceDate:startDate]];
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let annual = calendar.dateWithEra(1, year: year.toInt()!, month: month.toInt()!, day: day.toInt()!, hour: 19, minute: 00, second: 0, nanosecond: 0)!
        

        
        
        
        let timeText = annual.timeIntervalSinceDate(now)
        
        timeLabel.text = String(stringInterpolationSegment: Int(timeText/60/60)) + "時間" + String(stringInterpolationSegment: Int(timeText/60%60)) + "分" + String(stringInterpolationSegment: Int(timeText%60)) + "秒"
        
//        println((annualSalary / 12 / 22) * ((3600 * 9) - timeText) / timeText)
        
//        println((3600 * 9) - timeText) / timeText)
        
//        println((annualSalary / 12 / 22) * ((3600 * 9) - timeText) / (3600 * 9))
        
        let salary = (annualSalary / 12 / 22)
        let salary2 = ((3600 * 9) - (timeText)) / (3600 * 9)
        let result = Int(Double(salary) * salary2)
        
        salaryLabel.text = String(stringInterpolationSegment: result) + "円"
        
        

        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

