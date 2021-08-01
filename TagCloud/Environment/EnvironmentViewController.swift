//
//  EnvironmentViewController.swift
//  TagCloud
//
//  Created by Ruslan Sirazhetdinov on 01.08.2021.
//

import UIKit
import CoreGraphics
import CoreMotion

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

extension CGRect {
    static func random(referenceView: UIView) -> CGRect {
        return CGRect(x: .random(in: referenceView.bounds.minX...referenceView.bounds.maxX),
                      y: .random(in: referenceView.bounds.minY...referenceView.bounds.maxY),
                      width: .random(in: referenceView.bounds.minX...referenceView.bounds.midX/2),
                      height: .random(in: referenceView.bounds.minY...referenceView.bounds.midY/2)
        )
    }
}

class UIEnvironmentController: UIViewController {
    var squares: [UIView]?
    var animator: UIDynamicAnimator?
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squares = []
        
        for _ in 1...10 {
            var dimen = CGRect.random(referenceView: self.view)
            let square = UIView(frame: dimen)
            square.backgroundColor = .random
            squares?.append(square)
            
            self.view.addSubview(square)
        }
        
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let gravity = UIGravityBehavior(items: squares!)
        let direction = CGVector(dx: 0.0, dy: 0.0)
        gravity.gravityDirection = direction
        
        let boundaries = UICollisionBehavior(items: squares!)
        boundaries.translatesReferenceBoundsIntoBoundary = true
        
        let bounce = UIDynamicItemBehavior(items: squares!)
        bounce.elasticity = 0.5
        
        animator?.addBehavior(gravity)
        animator?.addBehavior(boundaries)
        animator?.addBehavior(bounce)
        
        
        manager.startGyroUpdates()
        manager.startAccelerometerUpdates()
        
        
        Timer.scheduledTimer(withTimeInterval: (1.0/60.0), repeats: true) { (timer) in
            
            if let gdata = self.manager.gyroData {
                let x = gdata.rotationRate.x
                let y = gdata.rotationRate.y
                let z = gdata.rotationRate.z
                
                
            }
            if let adata = self.manager.accelerometerData {
                let x = adata.acceleration.x
                let y = adata.acceleration.y
                let z = adata.acceleration.z
                
                let direction = CGVector(dx: x, dy: -y)
                gravity.gravityDirection = direction
            }
            
            
        }
        
        
    }
}
