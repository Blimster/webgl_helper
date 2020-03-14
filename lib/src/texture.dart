part of webgl_helper;

class Texture {
  web_gl.Texture _texture;
  bool _loaded;

  Texture() {
    _loaded = false;
    _texture = _context.createTexture();
  }

  void data(html.ImageElement image) {
    bind();
    _context.pixelStorei(web_gl.WebGL.UNPACK_FLIP_Y_WEBGL, 1);
    _context.texImage2D(
        web_gl.WebGL.TEXTURE_2D, 0, web_gl.WebGL.RGBA, web_gl.WebGL.RGBA, web_gl.WebGL.UNSIGNED_BYTE, image);
    _context.texParameteri(web_gl.WebGL.TEXTURE_2D, web_gl.WebGL.TEXTURE_MIN_FILTER, web_gl.WebGL.NEAREST);
    _context.texParameteri(web_gl.WebGL.TEXTURE_2D, web_gl.WebGL.TEXTURE_MAG_FILTER, web_gl.WebGL.NEAREST);
    unbind();

    _loaded = true;
  }

  bool get loaded => _loaded;

  void bind() {
    _context.bindTexture(web_gl.WebGL.TEXTURE_2D, _texture);
  }

  void unbind() {
    _context.bindTexture(web_gl.WebGL.TEXTURE_2D, null);
  }

  void activateUnitAndBindIfLoaded(TextureUnit unit, [UniformLocation uniform]) {
    if (_loaded) {
      _context.activeTexture(unit.glConst);
      bind();

      if (uniform != null) {
        uniform.set1i(unit.unit);
      }
    }
  }
}
