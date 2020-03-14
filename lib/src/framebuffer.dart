part of webgl_helper;

class Framebuffer {
  static Framebuffer _boundFramebuffer;

  web_gl.Framebuffer _framebuffer;

  Framebuffer() {
    _framebuffer = _context.createFramebuffer();
  }

  void bind() {
    if (_boundFramebuffer != this) {
      _boundFramebuffer = this;
      _context.bindFramebuffer(web_gl.WebGL.FRAMEBUFFER, _framebuffer);
    }
  }

  void unbind() {
    _boundFramebuffer = null;
    _context.bindFramebuffer(web_gl.WebGL.FRAMEBUFFER, null);
  }

  void attach(Attachment attachment, Renderbuffer renderbuffer) {
    bind();
    _context.framebufferRenderbuffer(
        web_gl.WebGL.FRAMEBUFFER, attachment.glConst, web_gl.WebGL.RENDERBUFFER, renderbuffer._renderbuffer);
  }
}

class Renderbuffer {
  static Renderbuffer _boundRenderbuffer = null;
  web_gl.Renderbuffer _renderbuffer;

  Renderbuffer() {
    _renderbuffer = _context.createRenderbuffer();
  }

  void bind() {
    if (_boundRenderbuffer != this) {
      _boundRenderbuffer = this;
      _context.bindRenderbuffer(web_gl.WebGL.RENDERBUFFER, _renderbuffer);
    }
  }

  void unbind() {
    _boundRenderbuffer = null;
    _context.bindRenderbuffer(web_gl.WebGL.RENDERBUFFER, null);
  }

  void storage(InternalFormat internalFormat, int width, int height) {
    bind();
    _context.renderbufferStorage(web_gl.WebGL.RENDERBUFFER, internalFormat.glConst, width, height);
  }
}
