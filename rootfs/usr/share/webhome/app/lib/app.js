// SliTaz GNU/Linux : Start Page

// Open | Close Object
function openclose(obj){
  var btn = document.getElementById(obj);
    if(btn.style.display != "block"){
    btn.style.display = "block";
   }else{
     btn.style.display = "none";
   }
}
