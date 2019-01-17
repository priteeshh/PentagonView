//
//  ViewController.swift
//  PentagonSample
//
//  Created by Preeteesh Remalli on 18/01/19.
//  Copyright © 2019 Preeteesh Remalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let path1 = UIBezierPath()
    let path2 = UIBezierPath()
    let path3 = UIBezierPath()
    let path4 = UIBezierPath()
    let path5 = UIBezierPath()
    
    let border1 = CAShapeLayer()
    let border2 = CAShapeLayer()
    let border3 = CAShapeLayer()
    let border4 = CAShapeLayer()
    let border5 = CAShapeLayer()
    
    let contentColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor
    let boderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
    let selectedColor = #colorLiteral(red: 0.8526951671, green: 0.279165566, blue: 0.3038279414, alpha: 1).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHexagonImageView(imageView: imageView)

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        //tap.delegate = self as! UIGestureRecognizerDelegate // This is not required
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true

        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        let tapLocation:CGPoint = sender!.location(in: imageView)
        self.hitTest(tapLocation: CGPoint(x: tapLocation.x, y: tapLocation.y))
        
    }

    private func hitTest(tapLocation:CGPoint){
        
        if path1.contains(tapLocation){
            border1.fillColor = selectedColor
            border2.fillColor = contentColor
            border3.fillColor = contentColor
            border4.fillColor = contentColor
            border5.fillColor = contentColor
            
        }else if path2.contains(tapLocation){
            border1.fillColor = contentColor
            border2.fillColor = selectedColor
            border3.fillColor = contentColor
            border4.fillColor = contentColor
            border5.fillColor = contentColor        }
        else if path3.contains(tapLocation){
            border1.fillColor = contentColor
            border2.fillColor = contentColor
            border3.fillColor = selectedColor
            border4.fillColor = contentColor
            border5.fillColor = contentColor        }
        else if path4.contains(tapLocation){
            border1.fillColor = contentColor
            border2.fillColor = contentColor
            border3.fillColor = contentColor
            border4.fillColor = selectedColor
            border5.fillColor = contentColor
        }
        else if path5.contains(tapLocation){
            border1.fillColor = contentColor
            border2.fillColor = contentColor
            border3.fillColor = contentColor
            border4.fillColor = contentColor
            border5.fillColor = selectedColor
        }
    }
    func setupHexagonImageView(imageView: UIImageView) {
        let lineWidth: CGFloat = 5
        let cornerRadius : CGFloat = 10
        let sides = 5
        let rect = imageView.bounds

            let theta: CGFloat = CGFloat(2.0 * M_PI) / CGFloat(sides) // How much to turn at every corner
            let offset: CGFloat = cornerRadius * tan(theta / 2.0)     // Offset from which to start rounding corners
            let width = min(rect.size.width, rect.size.height)        // Width of the square
            
            let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)
            
            // Radius of the circle that encircles the polygon
            // Notice that the radius is adjusted for the corners, that way the largest outer
            // dimension of the resulting shape is always exactly the width - linewidth
            let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
            
            // Start drawing at a point, which by default is at the right hand edge
            // but can be offset
            var angle = CGFloat(CGFloat(Double.pi / 3.5))
            
            let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
            path1.move(to: center)
            path2.move(to: center)
            path3.move(to: center)
            path4.move(to: center)
            path5.move(to: center)
            path1.addLine(to: CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta)))
            
            // for _ in 0 ..< sides {
            angle += theta
        
        
        
            let corner1 = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
            let tip = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
            let start = CGPoint(x: corner1.x + cornerRadius * cos(angle - theta), y: corner1.y + cornerRadius * sin(angle - theta))
            let end = CGPoint(x: corner1.x + cornerRadius * cos(angle + theta), y: corner1.y + cornerRadius * sin(angle + theta))
            
            path1.addLine(to: end)
            //path1.addQuadCurve(to: end, controlPoint: tip)
            path1.close()
        
        //Second Path
        path2.addLine(to: end)

        angle += theta
        let corner2 = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
        let tip2 = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        let start2 = CGPoint(x: corner2.x + cornerRadius * cos(angle - theta), y: corner2.y + cornerRadius * sin(angle - theta))
        let end2 = CGPoint(x: corner2.x + cornerRadius * cos(angle + theta), y: corner2.y + cornerRadius * sin(angle + theta))
        path2.addLine(to: end2)
        //path1.addQuadCurve(to: end, controlPoint: tip)
        path2.close()
        
        //Third Path
        
        path3.addLine(to: end2)
        
        angle += theta
        let corner3 = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
        let tip3 = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        let start3 = CGPoint(x: corner3.x + cornerRadius * cos(angle - theta), y: corner3.y + cornerRadius * sin(angle - theta))
        let end3 = CGPoint(x: corner3.x + cornerRadius * cos(angle + theta), y: corner3.y + cornerRadius * sin(angle + theta))
        path3.addLine(to: end3)
        //path1.addQuadCurve(to: end, controlPoint: tip)
        path3.close()
        
        //Forth
        
        path4.addLine(to: end3)
        
        angle += theta
        let corner4 = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
        let tip4 = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        let start4 = CGPoint(x: corner4.x + cornerRadius * cos(angle - theta), y: corner4.y + cornerRadius * sin(angle - theta))
        let end4 = CGPoint(x: corner4.x + cornerRadius * cos(angle + theta), y: corner4.y + cornerRadius * sin(angle + theta))
        path4.addLine(to: end4)
        //path1.addQuadCurve(to: end, controlPoint: tip)
        path4.close()
        
        //Fifith
        
        path5.addLine(to: end4)
        
        angle += theta
        let corner5 = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
        let tip5 = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        let start5 = CGPoint(x: corner5.x + cornerRadius * cos(angle - theta), y: corner5.y + cornerRadius * sin(angle - theta))
        let end5 = CGPoint(x: corner5.x + cornerRadius * cos(angle + theta), y: corner5.y + cornerRadius * sin(angle + theta))
        path5.addLine(to: end5)
        //path1.addQuadCurve(to: end, controlPoint: tip)
        path5.close()
        
        

     //   for i in 0 ..< path.count{
        
        border1.path = path1.cgPath
       border1.lineWidth = lineWidth
        border1.strokeColor = boderColor
        border1.fillColor = contentColor
        let image = UIImage(named: "download") // Assign your image
        border1.fillColor = UIColor(patternImage: image!).cgColor
        imageView.layer.addSublayer(border1)
 

        border2.path = path2.cgPath
        border2.lineWidth = lineWidth
        border2.strokeColor = boderColor
        border2.fillColor = contentColor
        let image2 = UIImage(named: "download") // Assign your image
        border2.fillColor = UIColor(patternImage: image!).cgColor
        imageView.layer.addSublayer(border2)
        
        border3.path = path3.cgPath
        border3.lineWidth = lineWidth
        border3.strokeColor = boderColor
        border3.fillColor = contentColor
        let image3 = UIImage(named: "download") // Assign your image
        border3.fillColor = UIColor(patternImage: image!).cgColor
        imageView.layer.addSublayer(border3)
        
        border4.path = path4.cgPath
        border4.lineWidth = lineWidth
        border4.strokeColor = boderColor
        border4.fillColor = contentColor
        let image4 = UIImage(named: "download") // Assign your image
        border4.fillColor = UIColor(patternImage: image!).cgColor
        imageView.layer.addSublayer(border4)
        
        border5.path = path5.cgPath
        border5.lineWidth = lineWidth
        border5.strokeColor = boderColor
        border5.fillColor = contentColor
        let image5 = UIImage(named: "download") // Assign your image
        border5.fillColor = UIColor(patternImage: image5!).cgColor
        border5
        imageView.layer.addSublayer(border5)
        
    //}
    }


}

