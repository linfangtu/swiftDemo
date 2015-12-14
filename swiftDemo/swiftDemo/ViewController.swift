//
//  ViewController.swift
//  swiftDemo
//
//  Created by LinfangTu on 15/12/2.
//  Copyright © 2015年 LinfangTu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var nameText: UITextField!
    var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title        = "登录"
        self.view.backgroundColor        = UIColor.whiteColor()
        setNavitigationBar()

        self.nameText                         = UITextField(frame: CGRectZero)
        self.nameText.textColor               = kRGBA(0, g: 0, b: 0, a: 0.8)
        self.nameText.borderStyle             = UITextBorderStyle.RoundedRect
        self.nameText.placeholder             = "用户名"
        self.nameText.font                    = UIFont.systemFontOfSize(14)
        self.nameText.layoutIfNeeded()

        passwordText                     = UITextField(frame: CGRectZero)
        passwordText.placeholder         = "密码"
        passwordText.borderStyle         = UITextBorderStyle.RoundedRect
        passwordText.font                = UIFont.systemFontOfSize(14)
        passwordText.textColor           = kRGBA(0, g: 0, b: 0, a: 0.8)
        passwordText.secureTextEntry     = true
        passwordText.layoutIfNeeded()

        let signinButton                 = UIButton(type: UIButtonType.Custom)
        signinButton.frame               = CGRectZero
        signinButton.titleLabel?.font    = UIFont.boldSystemFontOfSize(16)
        signinButton.setTitleColor(kRGBA(0, g: 0, b: 0, a: 1), forState: UIControlState.Normal)
        signinButton.setTitle("登录", forState: UIControlState.Normal)
        signinButton.backgroundColor     = UIColor.lightGrayColor()
        signinButton.layer.cornerRadius  = 4
        signinButton.layer.masksToBounds = true
        signinButton.layoutIfNeeded()
        signinButton.addTarget(self, action: "signinButtonPress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(nameText)
        self.view.addSubview(passwordText)
        self.view.addSubview(signinButton)
        

        //使用Auto Layout的方式来布局
        nameText.translatesAutoresizingMaskIntoConstraints     = false
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        signinButton.translatesAutoresizingMaskIntoConstraints = false

        //创建水平方向约束
        let views:[String:AnyObject] = ["nameText": nameText, "passwordText": passwordText , "signinButton": signinButton]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[nameText]-20-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[passwordText]-20-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[signinButton]-20-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: views))
        //创建垂直方向约束
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-84-[nameText(==40)]-20-[passwordText(==40)]-20-[signinButton(==40)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: views))
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signup() {
        let signup : SignupViewController = SignupViewController()
        self.navigationController!.pushViewController(signup, animated: true)
    }

    func setNavitigationBar() {
        let rightItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "signup")
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    
    func signinButtonPress(sender: UIButton) {

        if nameText.text == "user" && passwordText.text == "password" {
            
            let detail : DetailViewController = DetailViewController()
            self.navigationController!.pushViewController(detail, animated: true)
        }
        else {
            print("user name is error!")
        }
    }

}

