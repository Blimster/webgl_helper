# webgl_helper

A small helper library to reduce boilerplate code when using the WebGL API.

## Features

The development of this library has just started. Many features are not completely implemented yet or missing at all.

- Reduces boilerplate code, e.g. connecting buffers to vertex attrib locations and draw in 1 call.
- Makes the WebGL API more type safe by adding types for a number of WebGL constants.
- Provides some helper functions, e.g. for create a projection or camera matrix.

This library is **not** a high level library like [three.js](http://threejs.org).

## Example

Here is a small example for using this library:

```dart

import 'dart:html';
import 'package:webgl_helper/webgl_helper.dart';

ShaderProgram program;
Buffer buffer;

main() {
  // query the canvas element
  var canvasElement = querySelector('#webgl-canvas');

  // init the webgl rendering context
  glInit(canvasElement);

  // set the color used to clear the color buffer
  glClearColor(0, 0, 0, 1);

  // enable blending and set the blend function
  glEnableBlend(true);
  glBlendFunc(BlendingCoefficient.SRC_ALPHA, BlendingCoefficient.ONE_MINUS_SRC_ALPHA);

  // create a shader program
  program = new ShaderProgram.fromSources(vertexShader, fragmentShader);

  // create a buffer that contains 2 types of per vertex data: positions and colors
  buffer = new Buffer(BufferTarget.ARRAY_BUFFER);
  buffer.data({
    'a_position': {
      Buffer.SIZE: 2, // 2 components per vertex (x, y)
      Buffer.DATA: [1.0, 1.0, 1.0, -1.0, -1.0, 1.0, -1.0, 1.0, 1.0, -1.0, -1.0, -1.0]
    },
    'a_color': {
      Buffer.SIZE: 3, // 3 components per vertex (r, g, b)
      Buffer.DATA: [1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0, 0.0]
    }
  });

  // start rendering
  window.requestAnimationFrame(render);
}

render(tick) {
  // clear the color buffer
  glClear([ClearMode.COLOR_BUFFER]);

  // draw the vertices using the given shader program and the vertex data stored in the buffer. additionally, set an
  // uniform.
  gluDrawArrays(program, buffer, uniformSetters: {
    'u_alpha': (uniform) => uniform.set1f(0.5)
  });

  // next frame
  window.requestAnimationFrame(render);
}

// the vertex shader...
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

// ...and the fragment shader
final fragmentShader = '''
#version 100

precision mediump float;

uniform float u_alpha;
varying vec3 v_color;

void main() {
  gl_FragColor = vec4(v_color, u_alpha);
}
''';

```
