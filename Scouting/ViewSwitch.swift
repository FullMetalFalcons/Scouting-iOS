//
//  ViewSwitch.swift
//  Scouting
//
//  Created by Alex DeMeo on 1/11/16.
//  Copyright © 2016 Alex DeMeo. All rights reserved.
//

import UIKit

class ViewSwitch: CustomView {
    var switches: [UISwitch] = [UISwitch]()
    private var switchToKey = [UISwitch : String]()
    var keys: [String] = [String]()
    
    init(title: String, keys: [String], switchTitles: [String]) {
        super.init(title: title, key: "")
        let width = (self.frame.width / CGFloat(switchTitles.count))
        self.keys = keys
        for (index, name) in switchTitles.enumerate() {
            let xpos = width * CGFloat(index)
            let s = UISwitch(frame: CGRect(x: xpos, y: 17.5, width: width, height: self.frame.height / 4))
            s.transform = CGAffineTransformMakeScale(CGFloat(1 / (2 * keys.count)) + 0.85, CGFloat(1 / (2 * keys.count)) + 0.85);
            switchToKey[s] = keys[index].trim()
            s.setOn(false, animated: true)
            KEYS[self.keys[index]] = "No"
            self.switches.append(s)
            s.addTarget(self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged)
            let lbl = UILabel(frame: CGRect(x: s.frame.minX + CGFloat(50 * (1 / keys.count)), y: 0, width: width, height: 17.5))
            lbl.text = name
            lbl.font = UIFont.systemFontOfSize(CustomView.textSize - (CGFloat(keys.count)))
            lbl.textAlignment = NSTextAlignment.Left
            self.addSubview(lbl)
            self.addSubview(s)
        }
        ViewControllerScout.arraySwitchViews.append(self)
    }
    
    func valueChanged(sender: UISwitch) {
        for sw in self.switches {
            if sender == sw {
                KEYS[switchToKey[sender]!] = sender.on ? "Yes" : "No"
                print("For key \(switchToKey[sw]!), value is: \(KEYS[switchToKey[sw]!]!)")
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
