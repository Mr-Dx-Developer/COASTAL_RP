/* Wath this in fullsize :)
  Im noob, I know it.
 */
 
var foregroundList = [];
var backgroundList = [];
var foregroundIndex = 0
var backgroundIndex = 0

var onScreen = true; 
var a = true


// Init stuff
$(document).ready(function(){
	generateList();
	$("#container").fadeIn(fadeDuration);
	
	change();
});

// Generate and shuffle the foreground images list
var foregroundImagesCount = 23
var backgroundImagesCount = 13

function generateList() {
	for (let i=0; i<foregroundImagesCount; i++) {
		foregroundList.push(i);
	}
	foregroundList = shuffle(foregroundList)
	
	for (let i=0; i<backgroundImagesCount; i++) {
		backgroundList.push(i);
	}
	backgroundList = shuffle(backgroundList)
}

function randomIntFromInterval(min, max) { // min and max included 
	return Math.floor(Math.random() * (max - min + 1) + min)
}

function shuffle(a) {
	var j, x, i;
	for (i = a.length - 1; i > 0; i--) {
		j = Math.floor(Math.random() * (i + 1));
		x = a[i];
		a[i] = a[j];
		a[j] = x;
	}
	return a;
}



// ANIMATION FOREGROUND
var duration = 10000
var fadeDuration = 1000

function manage() {
	if (onScreen) {
		setTimeout(change, duration);
	} else {
		$("#container").fadeOut(fadeDuration); 
	}
}

function change() {
	var foreground = $("#foreground-container")
	foreground.fadeOut(fadeDuration).fadeIn(fadeDuration);
	
	var background = $("#background")
	background.fadeOut(fadeDuration).fadeIn(fadeDuration);
	
	setTimeout(changeImg, fadeDuration, foreground, background);
	
	manage();
}

function changeImg(fground, bground) {
	if (foregroundIndex > foregroundList.length-1) { foregroundIndex = 0; }
	if (backgroundIndex > backgroundList.length-1) { backgroundIndex = 0; }
	
	$("#foregroundShader").css('background-image', 'url(assets/foreground/' + foregroundList[foregroundIndex] + '.png)');
	$("#foreground").css('background-image', 'url(assets/foreground/' + foregroundList[foregroundIndex] + '.png)');
	
	bground.css('background-image', 'url(assets/background/' + backgroundList[backgroundIndex] + '.jpg)');
	
	if (a) {
		a = false;
		
		fground.removeClass("foregroundToLeftAnim").addClass("foregroundToRightAnim");
		bground.removeClass("backgroundToLeftAnim").addClass("backgroundToRightAnim");
	} else {
		a = true;
	
		fground.removeClass("foregroundToRightAnim").addClass("foregroundToLeftAnim");
		bground.removeClass("backgroundToRightAnim").addClass("backgroundToLeftAnim");
	}
	
	foregroundIndex++; 
	backgroundIndex++; 
}
