//
//  ViewController.swift
//  MyFirebase
//
//  Created by kwsong on 2023/01/18.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var tfPW: UITextField!
    @IBOutlet weak var tfID: UITextField!
    @IBOutlet weak var labelLogin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    func updateUI()
    {
        if let user = Auth.auth().currentUser
        {
            // 로그인 된 상태, 이후 자동 로그인
            labelLogin.text = "Logged in : \(String(describing: user.email!))"
        }
        else
        {
            // 로그아웃 된 상태
            labelLogin.text = "Logged out"
        }
    }
    
    @IBAction func onBtnLogin(_ sender: Any)
    {
        if let textID = tfID.text, let textPW = tfPW.text
        {
            // 예외 처리
            if textID.count < 1 || textPW.count < 1
            {
                print("too short ID or PW")
                return
            }
            
            Auth.auth().signIn(withEmail: textID, password: textPW)
            {
                // 후행 클로저
                [weak self] user, error in
                
                // 언더바는 기본값
                // 에러시
                guard let _ = self else { return }
                
                print("Logged in")
                
                let user = Auth.auth().currentUser
                
                print("\(String(describing: user?.email!)), \(String(describing: user?.uid))")
                
                self?.updateUI()
            }
        }
        else
        {
            print("check your account")
        }
    }
    
    @IBAction func onBtnLogout(_ sender: Any)
    {
        let firebaseAuth = Auth.auth()
        
        do
        {
            try firebaseAuth.signOut()
        }
        catch let signOutError as NSError
        {
            print("SignOutError: %@", signOutError)
        }
        
        updateUI()
    }
    
    @IBAction func onBtnJoin(_ sender: Any)
    {
        if let textID = tfID.text, let textPW = tfPW.text
        {
            // 예외 처리
            if textID.count < 1 || textPW.count < 1
            {
                print("too short ID or PW")
                return
            }
            
            Auth.auth().createUser(withEmail: textID, password: textPW)
            {
                authResult, error in
                
                // 에러시
                guard let user = authResult?.user,
                      error == nil else
                {
                    print(error!.localizedDescription)
                    return
                }
                
                print("\(user.email!) success register")
                print("\(user.uid) success register")
            }
        }
        else
        {
            print("check your ID or PW")
        }
    }
    
}

