//
//  Util.swift
//  9thCircle
//
//  Created by Maurice Elliott on 24/05/2025.
//

import PlaydateKit

func formatFloat(double: Double) -> String {
    let int = Int(double)
    let frac = Int((double - Double(int)) * 100)
    return "\(int).\(frac)"
}

/// Performs a shallow search of the specified directory and returns the names of any contained items.
/// Taken from https://github.com/gurtt/trophy-case/blob/fe6ac04fc78cd88aa1308cec4e210da578a50b29/Sources/TrophyCase/FileHelper.swift#L17
/// - Parameters:
///   - path: The path to the directory whose contents you want to enumerate.
///   - skipHidden: An option to skip hidden files and directories.
/// - Returns: An array of `String` objects, each of which identifies a file or directory contained in `path`. Returns an empty array if the directory exists but has no contents. Subdirectories are indicated by a trailing slash *'/'*.
/// - Throws: `Playdate.Error` if no folder exists at `path` or it can't be opened.
func contentsOfDirectory(
    atPath path: String, skipHidden: Bool = true
) throws(Playdate.Error) -> [String] {
    class ArrayContainer { var contents: [String] = [] }

    let container = ArrayContainer()
    let containerPointer = UnsafeMutableRawPointer(Unmanaged.passUnretained(container).toOpaque())

    try File.listFiles(
        path: path,
        callback: {
            (fileNamePointer: UnsafePointer<CChar>?, containerPointer: UnsafeMutableRawPointer?) in
            guard let containerPointer else { return }
            let container = Unmanaged<ArrayContainer>.fromOpaque(containerPointer)
                .takeUnretainedValue()

            guard let fileNamePointer else { return }
            let fileName = String(cString: fileNamePointer)

            container.contents.append(fileName)
        }, userdata: containerPointer, showHidden: !skipHidden)

    return container.contents
}
