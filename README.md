# UICircleAnimation

 

![example1](https://user-images.githubusercontent.com/46787789/218880711-0a647cf5-ccf2-416c-b8c9-89de1b809373.png)</span>
![example2](https://user-images.githubusercontent.com/46787789/218880768-8b280c94-e206-4095-a6b9-4c990c526c88.png) 
![example3](https://user-images.githubusercontent.com/46787789/218880776-c6576743-b275-48a3-a4d3-57a473272aee.png)

```
let circleAnimation = UICircleAnimation(wrapperView: yourView)
        
        // Start animation angle
        circleAnimation.startAngle = .left
        
        // Color properties
        circleAnimation.circleProperties = .init(backgroundColor: .red, circleColor: .blue)
        
        // Change final value
        circleAnimation.percent = 55
        
        // Duration: default = 0.4
        circleAnimation.animationDuration = 0.9
        
        // border size: default = 10
        circleAnimation.lineWidth = 16
        
        // Label percent text color
        circleAnimation.percentLabel.textColor = .white
        circleAnimation.percentLabel.font = .systemFont(ofSize: 32,weight: .bold)
        
        let gradientLayer = CAGradientLayer()
      
        gradientLayer.colors = [
            UIColor.white.cgColor,
            UIColor.gray.withAlphaComponent(0.2).cgColor,
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        // Set gradiente background
        circleAnimation.gradientLayer = gradientLayer
        
        // Set border color
        circleAnimation.gradientBorderColor = [
            UIColor(named: "color1")!.cgColor,
            UIColor(named: "color2")!.cgColor,
        ]
        
        // Shadow properties
        circleAnimation.shadowProperties = .init(backgroundColor: UIColor.clear.cgColor, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 1.0), shadowOpacity: 0.6, shadowRadius: 4.0)
         
        
 
        // Start animation
        circleAnimation.start()
        ```
