//
//  ViewController.swift
//  ex01
//
//  Created by kwsong on 2023/01/17.
//

import UIKit

class ViewController: UIViewController
{
    // Interface Builder
    // Outlet variable
    // weak : 컴파일 지시어 메모리정책
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBOutlet weak var tfInput: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // 뷰가 로딩되었을 때 자동 호출
        
        labelTitle.backgroundColor = UIColor.cyan
        labelTitle.text = "Title"
        labelTitle.textColor = UIColor.black
        
        for btn in buttons
        {
            btn.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        }
        buttons[0].backgroundColor = UIColor.blue
        
    }
    
    @IBAction func onButton1Click(_ sender: Any)
    {
        print("button 1")
        labelTitle.text = "button1 Clicked"
    }
    
    @IBAction func onButton2Click(_ sender: Any)
    {
        print("button 2")
        labelTitle.text = "button2 Clicked"
    }
    
    @IBAction func onButton3Click(_ sender: Any)
    {
        print("button 3")
        labelTitle.text = "button3 Clicked"
    }
    
    @IBAction func onBtnInput(_ sender: Any)
    {
        let titleText = tfInput.text
        labelTitle.text = titleText
    }
}

