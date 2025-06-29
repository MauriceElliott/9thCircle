/// Represents an entity instance from LDtk Super Simple Export
/// Contains entity position, size, type, and custom field data
public class LDtkEntity {

    // MARK: - Properties

    /// Entity type identifier (numeric ID)
    public let typeId: UInt16

    /// Unique instance ID for this entity
    public let instanceId: UInt32

    /// Position of the entity within the level (in pixels)
    public let position: Point

    /// Size/dimensions of the entity
    public let size: Size

    /// Pivot point for the entity (normalized 0-255 for x and y)
    public let pivot: Point

    /// Smart color assigned to this entity type (RGB packed as UInt32)
    public let smartColor: UInt32

    /// Custom field values defined for this entity instance
    private var fields: LDtkFieldCollection

    /// Z-index/depth for rendering order
    public let zIndex: Int16

    // MARK: - Initialization

    public init() {
        self.typeId = 0
        self.instanceId = 0
        self.position = Point(x: 0, y: 0)
        self.size = Size(width: 0, height: 0)
        self.pivot = Point(x: 0, y: 0)
        self.smartColor = 0
        self.fields = LDtkFieldCollection()
        self.zIndex = 0
    }

    public init(
        typeId: UInt16,
        instanceId: UInt32,
        position: Point,
        size: Size,
        pivot: Point,
        smartColor: UInt32,
        zIndex: Int16
    ) {
        self.typeId = typeId
        self.instanceId = instanceId
        self.position = position
        self.size = size
        self.pivot = pivot
        self.smartColor = smartColor
        self.fields = LDtkFieldCollection()
        self.zIndex = zIndex
    }

    // MARK: - Public API

    /// Get a custom field value by field name
    /// - Parameters:
    ///   - fieldName: Name of the field as C string
    ///   - outValue: Pointer to store the field value
    /// - Returns: True if field found, false otherwise
    public func getCustomField(
        _ fieldName: UnsafePointer<CChar>,
        into outValue: UnsafeMutablePointer<LDtkFieldValue>
    ) -> Bool {
        // Stub implementation
        return false
    }

    /// Add a custom field to the entity
    /// - Parameter field: Field pair to add
    /// - Returns: True if added successfully, false if cache is full
    public func addCustomField(_ field: LDtkFieldPair) {
        // Stub implementation
        fields.append(field)
    }

    /// Get the center point of the entity
    /// Calculated from position, size, and pivot
    /// - Returns: Center point in level coordinates
    public func getCenterPosition() -> Point {
        // Stub implementation
        return Point(x: 0, y: 0)
    }

    /// Get the bounding rectangle of the entity
    /// - Returns: Rectangle representing entity bounds
    public func getBounds() -> Rectangle {
        // Stub implementation
        return Rectangle(x: 0, y: 0, width: 0, height: 0)
    }

    /// Check if this entity overlaps with another entity
    /// - Parameter otherEntity: Entity to check overlap with
    /// - Returns: True if entities overlap, false otherwise
    public func overlaps(with otherEntity: LDtkEntity) -> Bool {
        // Stub implementation
        return false
    }

    /// Check if this entity contains a specific point
    /// - Parameter point: Point to check
    /// - Returns: True if point is inside entity bounds, false otherwise
    public func contains(point: Point) -> Bool {
        // Stub implementation
        return false
    }

    /// Get distance squared to another entity (avoids floating point)
    /// - Parameter otherEntity: Entity to measure distance to
    /// - Returns: Squared distance between entity centers
    public func distanceSquared(to otherEntity: LDtkEntity) -> UInt64 {
        // Stub implementation
        return 0
    }

    /// Check if a field exists
    /// - Parameter fieldName: Name of the field to check as C string
    /// - Returns: True if field exists, false otherwise
    public func hasField(_ fieldName: UnsafePointer<CChar>) -> Bool {
        // Stub implementation
        return false
    }

    /// Get the entity's world position
    /// Accounts for level offset in multi-level worlds
    /// - Parameter levelWorldPosition: World position of the containing level
    /// - Returns: Entity position in world coordinates
    public func getWorldPosition(levelWorldPosition: Point) -> Point {
        // Stub implementation
        return Point(x: 0, y: 0)
    }
}

/// Information about an entity's associated tile/sprite
public struct LDtkEntityTileInfo {
    /// Tileset identifier
    public let tilesetId: UInt16

    /// Source rectangle in the tileset
    public let sourceRect: Rectangle

    /// Whether the tile is flipped horizontally
    public let flipX: Bool

    /// Whether the tile is flipped vertically
    public let flipY: Bool

    public init(tilesetId: UInt16, sourceRect: Rectangle, flipX: Bool, flipY: Bool) {
        self.tilesetId = tilesetId
        self.sourceRect = sourceRect
        self.flipX = flipX
        self.flipY = flipY
    }
}
