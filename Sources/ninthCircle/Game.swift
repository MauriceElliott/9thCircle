import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Lifecycle

    init() {
        player.addToDisplayList()
        // world = importer.loadProject(from: "TestWorld/simplified")
    }

    // MARK: Internal

    let player = Player()
    // let importer = LDtkImporter()
    // let world: LDtkResult<Bool>

    func update() -> Bool {
        Sprite.updateAndDrawDisplayListSprites()
        System.drawFPS()
        Graphics.drawText("Hello World", at: PlaydateKit.Point(x: 100, y: 100))
        return true
    }

    func gameWillPause() {
        print("Paused!")
    }
}

// MARK: - Logo

class Logo: Sprite.Sprite {
    // MARK: Lifecycle

    override init() {
        super.init()
        image = try! Graphics.Bitmap(path: "logo.png")
        bounds = .init(x: 0, y: 0, width: 400, height: 240)
    }

    // MARK: Internal

    override func update() {
        moveBy(dx: 0, dy: sinf(System.elapsedTime * 4))
    }
}
