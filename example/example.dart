import 'dart:html';
import 'package:webgl_helper/webgl_helper.dart';

ShaderProgram program;
Buffer buffer;

main() {
  var canvasElement = querySelector('#webgl-canvas');

  glInit(canvasElement);
  glClearColor(0, 0, 0, 1);

  glEnableBlend(true);
  glBlendFunc(BlendingCoefficient.SRC_ALPHA, BlendingCoefficient.ONE_MINUS_SRC_ALPHA);

  program = new ShaderProgram.fromSources(vertexShader, fragmentShader);

  buffer = new Buffer(BufferTarget.ARRAY_BUFFER);
  buffer.data({
    'a_position': {
      Buffer.SIZE: 2,
      Buffer.DATA: [1.0, 1.0, 1.0, -1.0, -1.0, 1.0, -1.0, 1.0, 1.0, -1.0, -1.0, -1.0]
    },
    'a_color': {
      Buffer.SIZE: 3,
      Buffer.DATA: [1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0, 0.0]
    }
  });

  window.requestAnimationFrame(render);
}

render(int tick) {
  glClear([ClearMode.COLOR_BUFFER]);

  gluDrawArrays(program, buffer, uniformSetters: {
    'u_alpha': (uniform) => uniform.set1f(0.5)
  });

  window.requestAnimationFrame(render);
}

final vertexShader = '''
#version 100

precision mediump float;

attribute vec2 a_position;
attribute vec3 a_color;
varying vec3 v_color;

void main() {
  v_color = a_color;
  gl_Position = vec4(a_position / 2.0, 0.0, 1.0);
}
''';

final fragmentShader = '''
#version 100

precision mediump float;

uniform float u_alpha;
varying vec3 v_color;

void main() {
  gl_FragColor = vec4(v_color, u_alpha);
}
''';