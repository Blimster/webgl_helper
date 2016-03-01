/*
 * This file is part of sf4webgl.
 *
 * sf4webgl is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesse General Public License as
 * published by the Free Software Foundation, either version 3 of
 * the License, or (at your option) any later version.
 *
 * sf4webgl is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with sf4webgl. If not, see <http://www.gnu.org/licenses/>.
 *
 * (c) 2013 by Oliver Damm, Am Wasserberg 8, 22869 Schenefeld
 *
 * mail: oliver [dot] damm [at] gmx [dot] de
 * web: http://www.blimster.net
 */
library webgl_helper;

import 'dart:math';
import 'dart:web_gl' as WebGL;
import 'dart:typed_data' as TypedData;
import 'dart:html' as Html;
import 'package:vector_math/vector_math.dart' as VecMath;

export 'package:vector_math/vector_math.dart';

part 'src/constants.dart';
part 'src/context.dart';
part 'src/shader.dart';
part 'src/buffer.dart';
part 'src/vertexattrib.dart';
part 'src/uniform.dart';
part 'src/framebuffer.dart';
part 'src/texture.dart';