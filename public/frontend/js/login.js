//creating a canvas using JS
var canvas = document.getElementById('myCanvas');
//making the canvas fullscreen
var w = canvas.width = window.innerWidth;
var h = canvas.height = window.innerHeight;

var fov = 350; //pixels are 450px away from us

var ctx = canvas.getContext("2d");
//appending the canvas to the body

//an array of pixels with 3 dimensional coordinates
//a square sheet of dots separated by 15px
var pixels = [];
for(var x = -600; x < 600; x+=10)
	for(var z = -600; z < 600; z+=10)
		pixels.push({x: x, y: 140, z: z});

//time to draw the pixels
function render()
{
	ctx.clearRect(0,0,w,h);
	//grabbing a screenshot of the canvas using getImageData
	var imagedata = ctx.getImageData(0,0,w,h);
	//looping through all pixel points
	var i = pixels.length;
	while(i--)
	{
		var pixel = pixels[i];
		//calculating 2d position for 3d coordinates
		//fov = field of view = denotes how far the pixels are from us.
		//the scale will control how the spacing between the pixels will decrease with increasing distance from us.
		var scale = fov/(fov+pixel.z);
		var x2d = pixel.x * scale + w/2;
		var y2d = pixel.y * scale + h/3;
		//marking the points green - only if they are inside the screen
		if(x2d >= 0 && x2d <= w && y2d >= 0 && y2d <= h)
		{
			//imagedata.width gives the width of the captured region(canvas) which is multiplied with the Y coordinate and then added to the X coordinate. The whole thing is multiplied by 4 because of the 4 numbers saved to denote r,g,b,a. The final result gives the first color data(red) for the pixel.
			var c = (Math.round(y2d) * imagedata.width + Math.round(x2d))*4;
			imagedata.data[c] = 250; //red
			imagedata.data[c+1] = 250; //green
			imagedata.data[c+2] = 250; //blue
			imagedata.data[c+3] = 255; //alpha
		}
		pixel.z -= 1;
		if(pixel.z < -fov) pixel.z += 2*fov;
	}
	//putting imagedata back on the canvas
	ctx.putImageData(imagedata, 0, 0);
}
//render()
//animation time
setInterval(render, 1000/30);

$('.tab a').on('click', function (e) {

  e.preventDefault();

  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');

  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();

  $(target).fadeIn(600);

});