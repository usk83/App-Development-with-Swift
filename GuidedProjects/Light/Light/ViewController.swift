//
//  ViewController.swift
//  Light
//
//  Created by Yusuke on 2020/04/21.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

extension Bool {
    public mutating func toggle() {
        self = !self
    }
}

class ViewController: UIViewController {
    var lightOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }

    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
}
