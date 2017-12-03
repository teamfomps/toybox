function AudioPlayer() {
  var isPlaying = false;
  var currentUrl = '';
  var dummy = {
    stop: function() {}
  };
  var sound  = dummy;

  return {
    select: function(url) {
      sound.stop();
      if (url === currentUrl) {
        currentUrl = '';
        return;
      }
      sound = new Howl({src: [url]});
      currentUrl = url;
      sound.play();
    }
  }
}
