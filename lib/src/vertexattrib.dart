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

class VertexAttribLocation {
  String _name;
  int _index;

  VertexAttribLocation(this._name, this._index);

  String get name => _name;

  void enableVertexAttribArray() {
    _context.enableVertexAttribArray(_index);
  }

  void disableVertexAttribArray() {
    _context.disableVertexAttribArray(_index);
  }

  void setPointer(Buffer buffer) {
    buffer._bufferDataInfos.forEach((dataInfo) {
      if (dataInfo.name == _name) {
        buffer.bind();
        enableVertexAttribArray();
        var overallSize = buffer._bufferDataInfos.map((p) => p.size).reduce((s1, s2) => s1 + s2);
        _context.vertexAttribPointer(_index, dataInfo.size, buffer._type.glConst, dataInfo.normalized,
            overallSize * buffer._type.dataSize, dataInfo.offset * buffer._type.dataSize);
      }
    });
  }

  void set3f(num x, num y, num z) {
    disableVertexAttribArray();
    _context.vertexAttrib3f(_index, x, y, z);
  }

  void set4f(num x, num y, num z, num w) {
    disableVertexAttribArray();
    _context.vertexAttrib4f(_index, x, y, z, w);
  }
}
