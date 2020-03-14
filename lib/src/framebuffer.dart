part of webgl_helper;

class Framebuffer {
  static Framebuffer _boundFramebuffer;

  WebGL.Framebuffer _framebuffer;

  Framebuffer() {
    _framebuffer = _context.createFramebuffer();
  }

  void bind() {
    if (_boundFramebuffer != this) {
      _boundFramebuffer = this;
      _context.bindFramebuffer(WebGL.WebGL.FRAMEBUFFER, _framebuffer);
    }
  }

  void unbind() {
    _boundFramebuffer = null;
    _context.bindFramebuffer(WebGL.WebGL.FRAMEBUFFER, null);
  }

  void attach(Attachment attachment, Renderbuffer renderbuffer) {
    bind();
    _context.framebufferRenderbuffer(
        WebGL.WebGL.FRAMEBUFFER, attachment.glConst, WebGL.WebGL.RENDERBUFFER, renderbuffer._renderbuffer);
  }
}

class Renderbuffer {
  static Renderbuffer _boundRenderbuffer = null;
  WebGL.Renderbuffer _renderbuffer;

  Renderbuffer() {
    _renderbuffer = _context.createRenderbuffer();
  }

  void bind() {
    if (_boundRenderbuffer != this) {
      _boundRenderbuffer = this;
      _context.bindRenderbuffer(WebGL.WebGL.RENDERBUFFER, _renderbuffer);
    }
  }

  void unbind() {
    _boundRenderbuffer = null;
    _context.bindRenderbuffer(WebGL.WebGL.RENDERBUFFER, null);
  }

  void storage(InternalFormat internalFormat, int width, int height) {
    bind();
    _context.renderbufferStorage(WebGL.WebGL.RENDERBUFFER, internalFormat.glConst, width, height);
  }
}
