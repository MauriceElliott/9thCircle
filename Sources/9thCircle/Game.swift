import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Lifecycle

    init() {
        logo.addToDisplayList()
    }

    // MARK: Internal

    let logo = Logo()

    func update() -> Bool {
        Sprite.updateAndDrawDisplayListSprites()
        System.drawFPS()
        return true
    }

    func gameWillPause() {
        print("Paused!")
    }
}
