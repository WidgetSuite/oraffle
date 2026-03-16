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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oraffle/domain/models/raffle/raffle_logo.dart';

/// A widget that can display both raster images and SVG files
class LogoWidget extends StatefulWidget {
  final RaffleLogo? logo;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final Widget Function(BuildContext)? loadingBuilder;

  const LogoWidget({
    super.key,
    required this.logo,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.errorBuilder,
    this.loadingBuilder,
  });

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    final logo = widget.logo;

    if (logo == null) {
      return widget.errorBuilder?.call(context, 'No logo provided', null) ??
          const SizedBox.shrink();
    }

    if (logo.isSvg) {
      return _buildSvgWidget(logo);
    } else if (logo.isRaster) {
      return _buildRasterWidget(logo);
    } else {
      return widget.errorBuilder?.call(
            context,
            'Unsupported logo type: ${logo.type}',
            null,
          ) ??
          const SizedBox.shrink();
    }
  }

  Widget _buildSvgWidget(RaffleLogo logo) {
    final svgString = logo.svgString;

    if (svgString == null) {
      return widget.errorBuilder?.call(
            context,
            'Could not parse SVG data',
            null,
          ) ??
          const SizedBox.shrink();
    }

    return SvgPicture.string(
      svgString,
      height: widget.height,
      width: widget.width,
      fit: widget.fit,
      placeholderBuilder: widget.loadingBuilder != null
          ? (context) => widget.loadingBuilder!(context)
          : null,
    );
  }

  Widget _buildRasterWidget(RaffleLogo logo) {
    return Image.memory(
      logo.data,
      height: widget.height,
      width: widget.width,
      fit: widget.fit,
      errorBuilder: widget.errorBuilder,
      frameBuilder: widget.loadingBuilder != null
          ? (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return frame != null ? child : widget.loadingBuilder!(context);
            }
          : null,
    );
  }
}
