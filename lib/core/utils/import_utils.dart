// Copyright (C) 2026 Widget Suite
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

/// Utility helpers for import-related features.
///
/// Central place for import configuration used across the app.
abstract class ImportUtils {
  /// Allowed file extensions for imports (without the leading dot).
  ///
  /// Example: `['csv']` means files with extension `.csv` are accepted.
  static List<String> get extensionsAllowed => ['csv'];
}
