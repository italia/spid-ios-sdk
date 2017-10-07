// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {
  /// OK
  static let alertOkTitle = L10n.tr("Localizable", "ALERT_OK_TITLE")
  /// Annulla
  static let annullaTitle = L10n.tr("Localizable", "ANNULLA_TITLE")
  /// Temporanei problemi di collegamento
  static let attenzioneServiceBody = L10n.tr("Localizable", "ATTENZIONE_SERVICE_BODY")
  /// Attenzione
  static let attenzioneTitle = L10n.tr("Localizable", "ATTENZIONE_TITLE")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
