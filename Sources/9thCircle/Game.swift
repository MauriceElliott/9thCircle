import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Lifecycle

    init() {
        player.addToDisplayList()
    }

    // MARK: Internal

    let player = Player()

    func update() -> Bool {
        Sprite.updateAndDrawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        print("Paused!")
    }
}
