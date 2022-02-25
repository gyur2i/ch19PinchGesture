//
//  ViewController.swift
//  ch19PinchGesture
//
//  Created by 김규리 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var txtPinch: UILabel!
    @IBOutlet var imgPinch: UIImageView!
    
    // 글자 크기 변수 선언
    var initialFontSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UIPinchGestureRecognizer 클래스 상수 pinch 선언
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:))) // 액션 인수 : 핀치 제스처가 인식 되었을 때 실행할 메서드
        self.view.addGestureRecognizer(pinch) // 뷰 객체의 addGestureRecognizer 메서드를 사용해 핀치 제스처를 등록
    }

//    // 핀치 제스처가 인식되었을 때 실행할 액션 메서드
//    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
//        // 핀치 제스처의 상태를 확인
//        if (pinch.state == UIGestureRecognizer.State.began) { // 시작이면
//            initialFontSize = txtPinch.font.pointSize // initialFontSize 변수에 현재 텍스트의 글자 크기 저장
//        } else { // 시작이 아니라면 핀치 제스처가 진행되고 있는 상태
//            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale) // 핀치의 스케일 속성을 곱해 텍스트 글자 크기에 반영
//        }
//    }
    
    // 핀치 제스처가 인식되었을 때 실행할 액션 메서드 : 이미지
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale) // imgPinch를 스케일에 맞게 변환
        pinch.scale = 1 // 다음 변환을 위해 1로 다시 바꿔주기
    }

}

