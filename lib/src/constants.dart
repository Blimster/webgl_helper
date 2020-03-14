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
part of webgl_helper;

abstract class WebGlConst {
  final int glConst;

  const WebGlConst(this.glConst);
}

class DataType extends WebGlConst {
  static const DataType BYTE = DataType(WebGL.WebGL.BYTE, 1);
  static const DataType SHORT = DataType(WebGL.WebGL.SHORT, 2);
  static const DataType UNSIGNED_BYTE = DataType(WebGL.WebGL.UNSIGNED_BYTE, 1);
  static const DataType UNSIGNED_SHORT = DataType(WebGL.WebGL.UNSIGNED_SHORT, 2);
  static const DataType FLOAT = DataType(WebGL.WebGL.FLOAT, 4);

  final int dataSize;

  const DataType(int glConst, this.dataSize) : super(glConst);

  static TypedData.ByteBuffer _createBuffer(DataType type, List<num> data) {
    switch (type) {
      case BYTE:
        return new TypedData.Int8List.fromList(data).buffer;
      case SHORT:
        return new TypedData.Int16List.fromList(data).buffer;
      case UNSIGNED_BYTE:
        return new TypedData.Uint8List.fromList(data).buffer;
      case UNSIGNED_SHORT:
        return new TypedData.Uint16List.fromList(data).buffer;
      case FLOAT:
        return new TypedData.Float32List.fromList(data).buffer;
      default:
        throw new ArgumentError('unsupported type!');
    }
  }
}

class BufferUsage extends WebGlConst {
  static const BufferUsage STATIC_DRAW = BufferUsage(WebGL.WebGL.STATIC_DRAW);
  static const BufferUsage DYNAMIC_DRAW = BufferUsage(WebGL.WebGL.DYNAMIC_DRAW);
  static const BufferUsage STREAM_DRAW = BufferUsage(WebGL.WebGL.STREAM_DRAW);

  const BufferUsage(int glConst) : super(glConst);
}

class BufferTarget extends WebGlConst {
  static const BufferTarget ARRAY_BUFFER = BufferTarget(WebGL.WebGL.ARRAY_BUFFER);
  static const BufferTarget ELEMENT_ARRAY_BUFFER = BufferTarget(WebGL.WebGL.ELEMENT_ARRAY_BUFFER);

  const BufferTarget(int glConst) : super(glConst);
}

class FrontFaceMode extends WebGlConst {
  static const FrontFaceMode CW = FrontFaceMode(WebGL.WebGL.CW);
  static const FrontFaceMode CCW = FrontFaceMode(WebGL.WebGL.CCW);

  const FrontFaceMode(int glConst) : super(glConst);
}

class CullFaceMode extends WebGlConst {
  static const CullFaceMode FRONT = CullFaceMode(WebGL.WebGL.FRONT);
  static const CullFaceMode BACK = CullFaceMode(WebGL.WebGL.BACK);

  const CullFaceMode(int glConst) : super(glConst);
}

class ClearMode extends WebGlConst {
  static const ClearMode COLOR_BUFFER = ClearMode(WebGL.WebGL.COLOR_BUFFER_BIT);
  static const ClearMode DEPTH_BUFFER = ClearMode(WebGL.WebGL.DEPTH_BUFFER_BIT);

  const ClearMode(int glConst) : super(glConst);
}

class DrawMode extends WebGlConst {
  static const DrawMode TRIANGLES = DrawMode(WebGL.WebGL.TRIANGLES);
  static const DrawMode TRIANGLE_FAN = DrawMode(WebGL.WebGL.TRIANGLE_FAN);
  static const DrawMode TRIANGLE_STRIP = DrawMode(WebGL.WebGL.TRIANGLE_STRIP);
  static const DrawMode LINES = DrawMode(WebGL.WebGL.LINES);
  static const DrawMode LINE_STRIP = DrawMode(WebGL.WebGL.LINE_STRIP);
  static const DrawMode LINE_LOOP = DrawMode(WebGL.WebGL.LINE_LOOP);

  const DrawMode(int glConst) : super(glConst);
}

class InternalFormat extends WebGlConst {
  static const InternalFormat RGBA4 = InternalFormat(WebGL.WebGL.RGBA4);
  static const InternalFormat RGB565 = InternalFormat(WebGL.WebGL.RGB565);
  static const InternalFormat RGB5_A1 = InternalFormat(WebGL.WebGL.RGB5_A1);
  static const InternalFormat DEPTH_COMPONENT16 = InternalFormat(WebGL.WebGL.DEPTH_COMPONENT16);
  static const InternalFormat STENCIL_INDEX8 = InternalFormat(WebGL.WebGL.STENCIL_INDEX8);

  const InternalFormat(int glConst) : super(glConst);
}

class Attachment extends WebGlConst {
  static const Attachment COLOR_ATTACHMENT0 = Attachment(WebGL.WebGL.COLOR_ATTACHMENT0);
  static const Attachment DEPTH_ATTACHMENT = Attachment(WebGL.WebGL.DEPTH_ATTACHMENT);
  static const Attachment STENCIL_ATTACHMENT = Attachment(WebGL.WebGL.STENCIL_ATTACHMENT);

  const Attachment(int glConst) : super(glConst);
}

class BlendingCoefficient extends WebGlConst {
  static const BlendingCoefficient ZERO = BlendingCoefficient(WebGL.WebGL.ZERO);
  static const BlendingCoefficient ONE = BlendingCoefficient(WebGL.WebGL.ONE);
  static const BlendingCoefficient SRC_COLOR = BlendingCoefficient(WebGL.WebGL.SRC_COLOR);
  static const BlendingCoefficient ONE_MINUS_SRC_COLOR = BlendingCoefficient(WebGL.WebGL.ONE_MINUS_SRC_COLOR);
  static const BlendingCoefficient SRC_ALPHA = BlendingCoefficient(WebGL.WebGL.SRC_ALPHA);
  static const BlendingCoefficient ONE_MINUS_SRC_ALPHA = BlendingCoefficient(WebGL.WebGL.ONE_MINUS_SRC_ALPHA);
  static const BlendingCoefficient DST_COLOR = BlendingCoefficient(WebGL.WebGL.DST_COLOR);
  static const BlendingCoefficient ONE_MINUS_DST_COLOR = BlendingCoefficient(WebGL.WebGL.ONE_MINUS_DST_COLOR);
  static const BlendingCoefficient DST_ALPHA = BlendingCoefficient(WebGL.WebGL.DST_ALPHA);
  static const BlendingCoefficient ONE_MINUS_DST_ALPHA = BlendingCoefficient(WebGL.WebGL.ONE_MINUS_DST_ALPHA);
  static const BlendingCoefficient CONSTANT_COLOR = BlendingCoefficient(WebGL.WebGL.CONSTANT_COLOR);
  static const BlendingCoefficient ONE_MINUS_CONSTANT_COLOR =
      const BlendingCoefficient(WebGL.WebGL.ONE_MINUS_CONSTANT_COLOR);
  static const BlendingCoefficient CONSTANT_ALPHA = BlendingCoefficient(WebGL.WebGL.CONSTANT_ALPHA);
  static const BlendingCoefficient ONE_MINUS_CONSTANT_ALPHA =
      const BlendingCoefficient(WebGL.WebGL.ONE_MINUS_CONSTANT_ALPHA);
  static const BlendingCoefficient SRC_ALPHA_SATURATE = BlendingCoefficient(WebGL.WebGL.SRC_ALPHA_SATURATE);

  const BlendingCoefficient(int glConst) : super(glConst);
}

class TextureUnit extends WebGlConst {
  static const TextureUnit TEXTURE0 = TextureUnit(WebGL.WebGL.TEXTURE0, 0);
  static const TextureUnit TEXTURE1 = TextureUnit(WebGL.WebGL.TEXTURE1, 1);

  final int unit;

  const TextureUnit(int glConst, this.unit) : super(glConst);
}
