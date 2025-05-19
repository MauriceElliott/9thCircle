import PlaydateKit

func formatFloat(double: Double) -> String {
    let int = Int(double)
    let frac = Int((double - Double(int)) * 100)
    return "\(int).\(frac)"
}

class Player: Sprite.Sprite {
    var velocity: (dx: Float, dy: Float)
    
    //Vars
    var isOnGround: Bool = true
    var isJumping: Bool = false
    
    //Debug values
    let groundLevelY: Float = 200

    override init() {
        velocity = (dx: 0, dy: 0)
        super.init()
        position.x = 120
        position.y = 200
        image = try! Graphics.Bitmap(path: "test.png")
//        bounds = .init(x: 120, y: 200, width: 20, height: 40)
        isOnGround = true
    }

    // MARK: Internal

    override func update() {
        velocity = (dx: 0, dy: 0)
        //Super accurate DeltaTime
        let dt = System.elapsedTime
        System.resetElapsedTime()
        
        print("start")
        
        if !System.buttonState.pushed.intersection([.a]).isEmpty {
            print("is jumping")
            isJumping = true
        }
        
        if position.y >= groundLevelY {
            isOnGround = true
        }
        
        let currentSpeed = isOnGround ? 0 : isJumping ? -1.000 : 1.000
        
        print("cs: \(Int(currentSpeed))")
        
        if !System.buttonState.pushed.intersection([.left]).isEmpty {
            print("left")
            velocity.dx = Float(-currentSpeed)
        }
        if !System.buttonState.pushed.intersection([.right]).isEmpty {
            print("right")
            velocity.dx = Float(currentSpeed)
        }
        
        if isJumping {
            print("is jumping!")
            velocity.dy = Float(currentSpeed)
        } else if !isOnGround {
            print("is on ground!")
            velocity.dy = Float(-currentSpeed)
        }
        
        print("vel, x: \(Int(velocity.dx)), y: \(Int(velocity.dy))")
        print("pos, x: \(Int(position.x)), y: \(Int(position.y))")
        print(formatFloat(double: Double(velocity.dy)))
        
        position = Point(x: (position.x + (velocity.dx * dt)), y: (position.y + (velocity.dy * dt)))
    }
}
