//
//  UploadViewController.swift
//  MyFirebase
//
//  Created by kwsong on 2023/01/18.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func onBtnUpload(_ sender: Any)
    {
        uploadImage()
    }
    
    func uploadImage()
    {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let data = imageView.image!.pngData()
        
        // 타임스탬프 : 시간을 나타내는 정수
        // 유니크한 파일 이름을 정할 때 사용
        let timeStamp = Int(NSDate.timeIntervalSinceReferenceDate * 1000)
        let imageFileName = "idol" + String(timeStamp) + ".png"
        
        let serverImageRef = storageRef.child(imageFileName)
        
        // 메타데이터 추가
        let metaData = StorageMetadata()
        
        metaData.contentType = "image/png"
        
        let uploadTask = serverImageRef.putData(data!, metadata: metaData)
        {
            // 후행클로저
            (metaData, error) in
            
            guard let metadata = metaData else
            {
                print("failed upload")
                self.textView.text.append("\nfailed upload")
                return
            }
            
                print("success upload")
                self.textView.text.append("\nsuccess upload")
                
                // download URL
                serverImageRef.downloadURL()
                {
                    // 후행 클로저
                    (url, error) in
                    
                    guard let downloadURL = url else
                    {
                        return
                    }
                    
                    self.textView.text.append("\n\(downloadURL.absoluteURL)")
                    
                    print("downloadURL: \n\(downloadURL.absoluteURL)")
                }
            
        }
    }
}
