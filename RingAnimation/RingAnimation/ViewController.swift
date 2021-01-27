//
//  ViewController.swift
//  RingAnimation
//
//  Created by Gökberk on 27.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view2: UIView!
    let shape = CAShapeLayer()
    var circleNumber = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        circle()
    
    }

    
    func circle() {
        
        //let shape = CAShapeLayer() CLASSIN ALTINA YAZ
        //var circleNumber = 0.0 Classın altına yaz
        let message = UILabel()
        message.text = "COMPLETING"
        message.textColor = .orange
        //message.font = UIFont(name: "Helvetica", size: 20)
        message.font = UIFont.boldSystemFont(ofSize: 22.0)
        
        message.translatesAutoresizingMaskIntoConstraints = false
        message.lineBreakMode = .byWordWrapping
        message.numberOfLines = 0
        message.textAlignment = .center

        self.view2.addSubview(message)
        message.widthAnchor.constraint(equalTo: view2.widthAnchor).isActive = true
        message.centerXAnchor.constraint(equalTo: view2.centerXAnchor).isActive = true
        message.centerYAnchor.constraint(equalTo: view2.centerYAnchor).isActive = true

        
        let circlePath = UIBezierPath(arcCenter: view2.center , radius: 100, startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 22
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view2.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 20
        shape.strokeColor = UIColor.orange.cgColor
        shape.strokeEnd = 0
        shape.fillColor = UIColor.clear.cgColor
        view2.layer.addSublayer(shape)
        showanimation()
        
    }
    
    func showanimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = circleNumber
        animation.duration = 1
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
    


    @IBAction func button(_ sender: Any) {
        circleNumber += 0.08
        circle()
    }
}

