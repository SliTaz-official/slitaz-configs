// Main.js
// Copyright (C) Slitaz GNU/Linux - BSD License

// --- Background Slide Show (4 img's with 10 sec to view)
// --- All images are "public domain license" by Vera Kratochvil.

    var imageCount = 0;
    var currentImage = 0;
    var images = new Array();
     
    images[0] = 'bg/bg0.jpg';
    images[1] = 'bg/bg1.jpg';
    images[2] = 'bg/bg2.jpg';
    images[3] = 'bg/bg3.jpg';
    images[4] = 'bg/bg4.jpg';
     
    var preLoadImages = new Array();
    for (var i = 0; i < images.length; i++)
    {
       if (images[i] == "")
          break;
     
       preLoadImages[i] = new Image();
       preLoadImages[i].src = images[i];
       imageCount++;
    }
     
function startSlideShow(){

   if (document.body && imageCount > 0)
   {
      document.body.style.backgroundImage = "url("+images[currentImage]+")";    
      document.body.style.backgroundSize = "cover"; // Full Screen
      document.body.style.backgroundRepeat = "no-repeat";
      document.body.style.backgroundPosition = "50% 50%"; // All page
     
      currentImage = currentImage + 1;
      if (currentImage > (imageCount-1))
      { 
         currentImage = 0;
      }
      setTimeout('startSlideShow()', 10000); // 10sec
   }
}
startSlideShow();
