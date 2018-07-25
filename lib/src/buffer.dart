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

class Buffer {
  static final String SIZE = "size";
  static final String NORMALIZED = "normalized";
  static final String DATA = "data";

  static Map<int, WebGL.Buffer> _boundBuffer = new Map<int, WebGL.Buffer>();

  WebGL.Buffer _buffer;
  int _target;
  DataType _type;
  int _numOfVertices;
  List<_BufferDataInfo> _bufferDataInfos = [];

  Buffer(BufferTarget target) {
    _buffer = _context.createBuffer();
    _target = target.glConst;
  }

  void bind() {
    if (_boundBuffer[_target] != _buffer) {
      _context.bindBuffer(_target, _buffer);
      _boundBuffer[_target] = _buffer;
    }
  }

  void data(Map<String, dynamic> data, [DataType type = DataType.FLOAT, BufferUsage usage = BufferUsage.STATIC_DRAW]) {
    _bufferDataInfos = [];
    _type = type;
    _numOfVertices = null;
    var vertexDataList = [];

    data.forEach((locName, locData) {
      var size = 4;
      var normalized = false;
      var data = <dynamic>[];

      if (locData is Map<String, dynamic>) {
        size = locData[SIZE] ?? size;
        normalized = locData[NORMALIZED] ?? normalized;
        data = locData[DATA] ?? data;
      } else if (locData is List) {
        data = locData;
      } else {
        throw new ArgumentError('expected value of key $locName to of type List or Map!');
      }

      final vertexData = <double>[];
      for (var elem in data) {
        if (elem is List<double>) {
          size = max(size, elem.length);
          for (var i = 0; i < size; i++) {
            if (i < elem.length) {
              vertexData.add(elem[i]);
            } else {
              vertexData.add(0.0);
            }
          }
        } else if (elem is double) {
          vertexData.add(elem);
        } else {
          throw new ArgumentError('vertex data is not of type num or List!');
        }
      }

      if (_numOfVertices == null) {
        _numOfVertices = vertexData.length ~/ size;
      } else {
        if (_numOfVertices != vertexData.length / size) {
          throw new ArgumentError('the number of per vertex data must be the same for every vertex attrib location!');
        }
      }

      vertexDataList.add(vertexData);
      _bufferDataInfos
          .add(new _BufferDataInfo(locName, size, normalized, _bufferDataInfos.isEmpty ? 0 : _bufferDataInfos.map((p) => p.size).reduce((s1, s2) => s1 + s2)));
    });

    final bufferData = new List<double>(vertexDataList.map((v) => v.length).reduce((l1, l2) => l1 + l2));
    final sumOfSizes = _bufferDataInfos.map((p) => p.size).reduce((s1, s2) => s1 + s2);
    var offset = 0;
    for (var p = 0; p < _bufferDataInfos.length; p++) {
      var bufferDataInfo = _bufferDataInfos[p];
      var vertexData = vertexDataList[p];
      for (int v = 0; v < _numOfVertices; v++) {
        for (int i = 0; i < bufferDataInfo.size; i++) {
          bufferData[offset + v * sumOfSizes + i] = vertexData[v * bufferDataInfo.size + i];
        }
      }
      offset += bufferDataInfo.size;
    }

    bind();
    _context.bufferData(_target, DataType._createBuffer(type, bufferData), usage.glConst);
  }

  int get numOfVertices => _numOfVertices;

  List<String> get vertexAttribLocationNames => _bufferDataInfos.map((bufferDataInfo) => bufferDataInfo.name).toList();
}

class _BufferDataInfo {
  String name;
  int size;
  bool normalized;
  int offset;

  _BufferDataInfo(this.name, this.size, this.normalized, this.offset);
}
