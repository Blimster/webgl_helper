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

WebGL.RenderingContext _context = null;

typedef UniformSetter(UniformLocation);

typedef VertexAttribSetter(VertexAttribLocation);

const alpha = 'alpha';
const depth = 'depth';
const stencil = 'stencil';
const antialias = 'antialias';
const premultipliedAlpha = 'premultipliedAlpha';
const preserveDrawingBuffer = 'preserveDrawingBuffer';
const preferLowPowerToHighPerformance = 'preferLowPowerToHighPerformance';
const failIfMajorPerformanceCaveat = 'failIfMajorPerformanceCaveat';

WebGL.RenderingContext get glContext => _context;

void glInit(Html.CanvasElement canvas, [Map attributes]) {
  _context = canvas.getContext3d();
  if (_context == null) {
    _context = canvas.getContext('webgl', attributes);
    if (_context == null) {
      _context = canvas.getContext('experimental-webgl', attributes);
    }
  }
}

TypedData.Uint8List glReadPixel(int x, int y) {
  TypedData.Uint8List result = new TypedData.Uint8List(4);
  _context.readPixels(
      x,
      y,
      1,
      1,
      WebGL.WebGL.RGBA,
      WebGL.WebGL.UNSIGNED_BYTE,
      result);
  return result;
}

void glDrawArrays(DrawMode drawMode, int first, int count) => _context.drawArrays(drawMode.glConst, first, count);

void glDrawElements(DrawMode drawMode, int count, DataType type, int offset) =>
    _context.drawElements(drawMode.glConst, count, type.glConst, offset);

void glViewport(int x, int y, int width, int height) => _context.viewport(x, y, width, height);

void glClearColor(num r, num g, num b, num a) => _context.clearColor(r, g, b, a);

void glClearDepth(num depth) => _context.clearDepth(depth);

void glClear(List<ClearMode> modes) {
  int mask = 0;
  for (ClearMode mode in modes) {
    mask |= mode.glConst;
  }
  _context.clear(mask);
}

void glBlendFunc(BlendingCoefficient sfactor, BlendingCoefficient dfactor) =>
    _context.blendFunc(sfactor.glConst, dfactor.glConst);

void glPolygonOffset(num factor, num units) => _context.polygonOffset(factor, units);

void glLineWidth(num width) => _context.lineWidth(width);

void glFrontFace(FrontFaceMode mode) => _context.frontFace(mode.glConst);

void glCullFace(CullFaceMode mode) => _context.cullFace(mode.glConst);

void glEnableDepthTest(bool enable) => _enable(enable, WebGL.WebGL.DEPTH_TEST);

void glEnableCullFace(bool enable) => _enable(enable, WebGL.WebGL.CULL_FACE);

void glEnablePolygonOffset(bool enable) => _enable(enable, WebGL.WebGL.POLYGON_OFFSET_FILL);

void glEnableBlend(bool enable) => _enable(enable, WebGL.WebGL.BLEND);

void gluDrawArrays(ShaderProgram program, Buffer buffer, {DrawMode drawMode: DrawMode.TRIANGLES,
Map<String, UniformSetter> uniformSetters: null, Map<String, VertexAttribSetter> vertexAttribSetters: null}) {
  program.use();
  buffer.vertexAttribLocationNames.forEach((name) =>
      program.getVertexAttribLocation(name).setPointer(buffer));
  uniformSetters?.forEach((name, setter) => setter(program.getUniform(name)));
  vertexAttribSetters?.forEach((name, setter) => setter(program.getVertexAttribLocation(name)));
  _context.drawArrays(drawMode.glConst, 0, buffer.numOfVertices);
}

void _enable(bool enable, int cap) {
  if (enable) {
    _context.enable(cap);
  }
  else {
    _context.disable(cap);
  }
}


