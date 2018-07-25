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

abstract class Shader {

  WebGL.Shader _shader;

  Shader(int shaderType, String source) {
    _shader = _context.createShader(shaderType);
    _context.shaderSource(_shader, source);
    _context.compileShader(_shader);

    final compileStatus = _context.getShaderParameter(_shader, WebGL.WebGL.COMPILE_STATUS);
    if (!compileStatus) {
      throw new StateError(_context.getShaderInfoLog(_shader));
    }
  }

}

class VertexShader extends Shader {

  VertexShader(String source) : super(WebGL.WebGL.VERTEX_SHADER, source);

}

class FragmentShader extends Shader {

  FragmentShader(String source) : super(WebGL.WebGL.FRAGMENT_SHADER, source);

}

class ShaderProgram {

  WebGL.Program _program;
  Map<String, VertexAttribLocation> _attributes = new Map<String, VertexAttribLocation>();
  Map<String, UniformLocation> _uniforms = new Map<String, UniformLocation>();

  ShaderProgram.fromShaders(VertexShader vertexShader, FragmentShader fragmentShader)
  {
    _program = _context.createProgram();
    _context.attachShader(_program, vertexShader._shader);
    _context.attachShader(_program, fragmentShader._shader);
    _context.linkProgram(_program);
  }

  ShaderProgram.fromSources(String vertexShaderSource, String fragmentShaderSource)
      : this.fromShaders(new VertexShader(vertexShaderSource), new FragmentShader(fragmentShaderSource));

  void use() {
    _context.useProgram(_program);
  }

  VertexAttribLocation getVertexAttribLocation(String name) {
    VertexAttribLocation attribute = _attributes[name];
    if (attribute == null) {
      attribute = new VertexAttribLocation(name, _context.getAttribLocation(_program, name));
      _attributes[name] = attribute;
    }
    return attribute;
  }

  UniformLocation getUniform(String name) {
    UniformLocation uniform = _uniforms[name];
    if (uniform == null) {
      uniform = new UniformLocation(name, _context.getUniformLocation(_program, name));
      _uniforms[name] = uniform;
    }
    return uniform;
  }

}
