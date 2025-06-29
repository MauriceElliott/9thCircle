/// Represents IntGrid layer data from LDtk Super Simple Export
/// Provides access to grid-based collision/logic data from CSV files
public class LDtkIntGridData {

    // MARK: - Properties

    /// Grid width in cells
    public let width: UInt32

    /// Grid height in cells
    public let height: UInt32

    /// Size of each grid cell in pixels
    public let cellSize: UInt32

    /// Raw grid data pointer (managed externally)
    private let gridDataPtr: UnsafePointer<Int32>?

    /// Whether the data has been loaded
    private var isDataLoaded: Bool

    /// Memory usage of this IntGrid data
    private var memoryUsage: UInt32

    // MARK: - Initialization

    public init() {
        self.width = 0
        self.height = 0
        self.cellSize = 0
        self.gridDataPtr = nil
        self.isDataLoaded = false
        self.memoryUsage = 0
    }

    public init(
        width: UInt32,
        height: UInt32,
        cellSize: UInt32,
        gridDataPtr: UnsafePointer<Int32>?
    ) {
        self.width = width
        self.height = height
        self.cellSize = cellSize
        self.gridDataPtr = gridDataPtr
        self.isDataLoaded = gridDataPtr != nil
        self.memoryUsage = UInt32(MemoryLayout<LDtkIntGridData>.size)
    }

    // MARK: - Public API

    /// Get IntGrid value at specific grid coordinates
    /// - Parameters:
    ///   - x: X coordinate in grid cells
    ///   - y: Y coordinate in grid cells
    /// - Returns: IntGrid value (0 for empty, positive integers for values)
    public func getValue(x: UInt32, y: UInt32) -> Int32 {
        // Stub implementation
        return 0
    }

    /// Get IntGrid value at pixel coordinates
    /// - Parameters:
    ///   - pixelX: X coordinate in pixels
    ///   - pixelY: Y coordinate in pixels
    /// - Returns: IntGrid value at that pixel location
    public func getValueAtPixel(x pixelX: Int32, y pixelY: Int32) -> Int32 {
        // Stub implementation
        return 0
    }

    /// Check if a grid cell is empty (value == 0)
    /// - Parameters:
    ///   - x: X coordinate in grid cells
    ///   - y: Y coordinate in grid cells
    /// - Returns: True if cell is empty, false otherwise
    public func isEmpty(x: UInt32, y: UInt32) -> Bool {
        // Stub implementation
        return true
    }

    /// Check if a pixel location is empty
    /// - Parameters:
    ///   - pixelX: X coordinate in pixels
    ///   - pixelY: Y coordinate in pixels
    /// - Returns: True if location is empty, false otherwise
    public func isEmptyAtPixel(x pixelX: Int32, y pixelY: Int32) -> Bool {
        // Stub implementation
        return true
    }

    /// Get all grid positions that have a specific value
    /// - Parameters:
    ///   - value: IntGrid value to search for
    ///   - buffer: Buffer to store matching positions
    ///   - maxCount: Maximum number of positions to return
    /// - Returns: Number of positions found
    public func getPositions(
        withValue value: Int32,
        into buffer: UnsafeMutablePointer<Point>,
        maxCount: Int
    ) -> Int {
        // Stub implementation
        return 0
    }

    /// Check if a rectangular region contains any non-empty cells
    /// - Parameters:
    ///   - x: Starting X coordinate
    ///   - y: Starting Y coordinate
    ///   - width: Width of region in cells
    ///   - height: Height of region in cells
    /// - Returns: True if region contains any non-zero values
    public func hasValuesInRegion(x: UInt32, y: UInt32, width: UInt32, height: UInt32) -> Bool {
        // Stub implementation
        return false
    }

    /// Convert grid coordinates to pixel coordinates
    /// - Parameters:
    ///   - gridX: X coordinate in grid cells
    ///   - gridY: Y coordinate in grid cells
    /// - Returns: Pixel coordinates of the cell's top-left corner
    public func gridToPixel(gridX: UInt32, gridY: UInt32) -> Point {
        // Stub implementation
        return Point(x: 0, y: 0)
    }

    /// Convert pixel coordinates to grid coordinates
    /// - Parameters:
    ///   - pixelX: X coordinate in pixels
    ///   - pixelY: Y coordinate in pixels
    /// - Returns: Grid coordinates containing that pixel
    public func pixelToGrid(pixelX: Int32, pixelY: Int32) -> Point {
        // Stub implementation
        return Point(x: 0, y: 0)
    }

    /// Get the pixel bounds of a grid cell
    /// - Parameters:
    ///   - gridX: X coordinate in grid cells
    ///   - gridY: Y coordinate in grid cells
    /// - Returns: Rectangle representing the pixel bounds of the cell
    public func getCellBounds(gridX: UInt32, gridY: UInt32) -> Rectangle {
        // Stub implementation
        return Rectangle(x: 0, y: 0, width: 0, height: 0)
    }

    /// Check if the data is currently loaded in memory
    /// - Returns: True if data is loaded, false otherwise
    public var isLoaded: Bool {
        return isDataLoaded
    }

    /// Clear cached data to free memory
    public func clearCache() {
        // Stub implementation - in real version would clear data
        self.isDataLoaded = false
    }

    /// Get estimated memory usage of the grid data
    /// - Returns: Estimated memory usage in bytes
    public func getMemoryUsage() -> UInt32 {
        return memoryUsage
    }

    /// Validate that coordinates are within grid bounds
    /// - Parameters:
    ///   - x: X coordinate to validate
    ///   - y: Y coordinate to validate
    /// - Returns: True if coordinates are valid, false otherwise
    public func isValidCoordinate(x: UInt32, y: UInt32) -> Bool {
        return x < width && y < height
    }
}

/// Helper structure representing a grid position with its value
public struct LDtkGridCell {
    /// Grid X coordinate
    public let x: UInt32

    /// Grid Y coordinate
    public let y: UInt32

    /// IntGrid value at this position
    public let value: Int32

    public init(x: UInt32, y: UInt32, value: Int32) {
        self.x = x
        self.y = y
        self.value = value
    }

    /// Get pixel coordinates of this cell
    public func pixelPosition(cellSize: UInt32) -> Point {
        return Point(x: Int32(x * cellSize), y: Int32(y * cellSize))
    }
}
