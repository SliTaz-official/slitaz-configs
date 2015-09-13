// Main.js
// Copyright (C) Slitaz GNU/Linux - BSD License

// --- Background Slide Show (4 img's with 10 sec to view)
// --- All images are "public domain license" by Vera Kratochvil.

var imageCount = 0;
var images = [ 'bg/bg0.jpg', 'bg/bg1.jpg', 'bg/bg2.jpg', 'bg/bg3.jpg', 'bg/bg4.jpg' ];

var preLoadImages = new Array();
for (var i = 0; i < images.length; i++)
{
  if (images[i] == "")
    break;

  preLoadImages[i] = new Image();
  preLoadImages[i].src = images[i];
  imageCount++;
}
var currentImage = Math.floor(Math.random() * imageCount);


function startSlideShow() {

  if (document.body && imageCount > 0)
  {
    document.body.style.backgroundImage = "url(" + images[currentImage] + ")";
    currentImage++;
    if (currentImage > (imageCount - 1))
      currentImage = 0;

    setTimeout('startSlideShow()', 10000); // 10sec
  }
}

startSlideShow();
