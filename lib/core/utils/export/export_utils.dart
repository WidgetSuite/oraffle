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

// Facade that conditionally imports the correct implementation for the current platform.
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

Future<String> downloadFile(String filename, Uint8List bytes, String mime) =>
    FileSaver.instance.saveFile(
      name: filename,
      bytes: bytes,
      customMimeType: mime,
    );
