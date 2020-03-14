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
  static const DataType BYTE = DataType(web_gl.WebGL.BYTE, 1);
  static const DataType SHORT = DataType(web_gl.WebGL.SHORT, 2);
  static const DataType UNSIGNED_BYTE = DataType(web_gl.WebGL.UNSIGNED_BYTE, 1);
  static const DataType UNSIGNED_SHORT = DataType(web_gl.WebGL.UNSIGNED_SHORT, 2);
  static const DataType FLOAT = DataType(web_gl.WebGL.FLOAT, 4);

  final int dataSize;

  const DataType(int glConst, this.dataSize) : super(glConst);

  static typed_data.ByteBuffer _createBuffer(DataType type, List<num> data) {
    switch (type) {
      case BYTE:
        return typed_data.Int8List.fromList(data).buffer;
      case SHORT:
        return typed_data.Int16List.fromList(data).buffer;
      case UNSIGNED_BYTE:
        return typed_data.Uint8List.fromList(data).buffer;
      case UNSIGNED_SHORT:
        return typed_data.Uint16List.fromList(data).buffer;
      case FLOAT:
        return typed_data.Float32List.fromList(data).buffer;
      default:
        throw ArgumentError('unsupported type!');
    }
  }
}

class BufferUsage extends WebGlConst {
  static const BufferUsage STATIC_DRAW = BufferUsage(web_gl.WebGL.STATIC_DRAW);
  static const BufferUsage DYNAMIC_DRAW = BufferUsage(web_gl.WebGL.DYNAMIC_DRAW);
  static const BufferUsage STREAM_DRAW = BufferUsage(web_gl.WebGL.STREAM_DRAW);

  const BufferUsage(int glConst) : super(glConst);
}

class BufferTarget extends WebGlConst {
  static const BufferTarget ARRAY_BUFFER = BufferTarget(web_gl.WebGL.ARRAY_BUFFER);
  static const BufferTarget ELEMENT_ARRAY_BUFFER = BufferTarget(web_gl.WebGL.ELEMENT_ARRAY_BUFFER);

  const BufferTarget(int glConst) : super(glConst);
}

class FrontFaceMode extends WebGlConst {
  static const FrontFaceMode CW = FrontFaceMode(web_gl.WebGL.CW);
  static const FrontFaceMode CCW = FrontFaceMode(web_gl.WebGL.CCW);

  const FrontFaceMode(int glConst) : super(glConst);
}

class CullFaceMode extends WebGlConst {
  static const CullFaceMode FRONT = CullFaceMode(web_gl.WebGL.FRONT);
  static const CullFaceMode BACK = CullFaceMode(web_gl.WebGL.BACK);

  const CullFaceMode(int glConst) : super(glConst);
}

class ClearMode extends WebGlConst {
  static const ClearMode COLOR_BUFFER = ClearMode(web_gl.WebGL.COLOR_BUFFER_BIT);
  static const ClearMode DEPTH_BUFFER = ClearMode(web_gl.WebGL.DEPTH_BUFFER_BIT);

  const ClearMode(int glConst) : super(glConst);
}

class DrawMode extends WebGlConst {
  static const DrawMode TRIANGLES = DrawMode(web_gl.WebGL.TRIANGLES);
  static const DrawMode TRIANGLE_FAN = DrawMode(web_gl.WebGL.TRIANGLE_FAN);
  static const DrawMode TRIANGLE_STRIP = DrawMode(web_gl.WebGL.TRIANGLE_STRIP);
  static const DrawMode LINES = DrawMode(web_gl.WebGL.LINES);
  static const DrawMode LINE_STRIP = DrawMode(web_gl.WebGL.LINE_STRIP);
  static const DrawMode LINE_LOOP = DrawMode(web_gl.WebGL.LINE_LOOP);

  const DrawMode(int glConst) : super(glConst);
}

class InternalFormat extends WebGlConst {
  static const InternalFormat RGBA4 = InternalFormat(web_gl.WebGL.RGBA4);
  static const InternalFormat RGB565 = InternalFormat(web_gl.WebGL.RGB565);
  static const InternalFormat RGB5_A1 = InternalFormat(web_gl.WebGL.RGB5_A1);
  static const InternalFormat DEPTH_COMPONENT16 = InternalFormat(web_gl.WebGL.DEPTH_COMPONENT16);
  static const InternalFormat STENCIL_INDEX8 = InternalFormat(web_gl.WebGL.STENCIL_INDEX8);

  const InternalFormat(int glConst) : super(glConst);
}

class Attachment extends WebGlConst {
  static const Attachment COLOR_ATTACHMENT0 = Attachment(web_gl.WebGL.COLOR_ATTACHMENT0);
  static const Attachment DEPTH_ATTACHMENT = Attachment(web_gl.WebGL.DEPTH_ATTACHMENT);
  static const Attachment STENCIL_ATTACHMENT = Attachment(web_gl.WebGL.STENCIL_ATTACHMENT);

  const Attachment(int glConst) : super(glConst);
}

class BlendingCoefficient extends WebGlConst {
  static const BlendingCoefficient ZERO = BlendingCoefficient(web_gl.WebGL.ZERO);
  static const BlendingCoefficient ONE = BlendingCoefficient(web_gl.WebGL.ONE);
  static const BlendingCoefficient SRC_COLOR = BlendingCoefficient(web_gl.WebGL.SRC_COLOR);
  static const BlendingCoefficient ONE_MINUS_SRC_COLOR = BlendingCoefficient(web_gl.WebGL.ONE_MINUS_SRC_COLOR);
  static const BlendingCoefficient SRC_ALPHA = BlendingCoefficient(web_gl.WebGL.SRC_ALPHA);
  static const BlendingCoefficient ONE_MINUS_SRC_ALPHA = BlendingCoefficient(web_gl.WebGL.ONE_MINUS_SRC_ALPHA);
  static const BlendingCoefficient DST_COLOR = BlendingCoefficient(web_gl.WebGL.DST_COLOR);
  static const BlendingCoefficient ONE_MINUS_DST_COLOR = BlendingCoefficient(web_gl.WebGL.ONE_MINUS_DST_COLOR);
  static const BlendingCoefficient DST_ALPHA = BlendingCoefficient(web_gl.WebGL.DST_ALPHA);
  static const BlendingCoefficient ONE_MINUS_DST_ALPHA = BlendingCoefficient(web_gl.WebGL.ONE_MINUS_DST_ALPHA);
  static const BlendingCoefficient CONSTANT_COLOR = BlendingCoefficient(web_gl.WebGL.CONSTANT_COLOR);
  static const BlendingCoefficient ONE_MINUS_CONSTANT_COLOR =
      const BlendingCoefficient(web_gl.WebGL.ONE_MINUS_CONSTANT_COLOR);
  static const BlendingCoefficient CONSTANT_ALPHA = BlendingCoefficient(web_gl.WebGL.CONSTANT_ALPHA);
  static const BlendingCoefficient ONE_MINUS_CONSTANT_ALPHA =
      const BlendingCoefficient(web_gl.WebGL.ONE_MINUS_CONSTANT_ALPHA);
  static const BlendingCoefficient SRC_ALPHA_SATURATE = BlendingCoefficient(web_gl.WebGL.SRC_ALPHA_SATURATE);

  const BlendingCoefficient(int glConst) : super(glConst);
}

class TextureUnit extends WebGlConst {
  static const TextureUnit TEXTURE0 = TextureUnit(web_gl.WebGL.TEXTURE0, 0);
  static const TextureUnit TEXTURE1 = TextureUnit(web_gl.WebGL.TEXTURE1, 1);

  final int unit;

  const TextureUnit(int glConst, this.unit) : super(glConst);
}
