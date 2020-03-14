part of webgl_helper;

class Texture {
  WebGL.Texture _texture;
  bool _loaded;

  Texture() {
    _loaded = false;
    _texture = _context.createTexture();
  }

  void data(Html.ImageElement image) {
    bind();
    _context.pixelStorei(WebGL.WebGL.UNPACK_FLIP_Y_WEBGL, 1);
    _context.texImage2D(
        WebGL.WebGL.TEXTURE_2D, 0, WebGL.WebGL.RGBA, WebGL.WebGL.RGBA, WebGL.WebGL.UNSIGNED_BYTE, image);
    _context.texParameteri(WebGL.WebGL.TEXTURE_2D, WebGL.WebGL.TEXTURE_MIN_FILTER, WebGL.WebGL.NEAREST);
    _context.texParameteri(WebGL.WebGL.TEXTURE_2D, WebGL.WebGL.TEXTURE_MAG_FILTER, WebGL.WebGL.NEAREST);
    unbind();

    _loaded = true;
  }

  bool get loaded => _loaded;

  void bind() {
    _context.bindTexture(WebGL.WebGL.TEXTURE_2D, _texture);
  }

  void unbind() {
    _context.bindTexture(WebGL.WebGL.TEXTURE_2D, null);
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
