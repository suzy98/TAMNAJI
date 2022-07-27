<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  

<title>탐나지!</title>
    <style>

*
{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
body 
{
	overflow: hidden;
}
section 
{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background: #236bc9;
}
section .runway 
{
	position: relative;
	width: 400px;
	height: 100vh;
	background: #244f9e;
	border-left: 50px solid rgba(0,0,0,0.25);
	border-right: 50px solid rgba(0,0,0,0.25);
	transition: transform 1s;
	transition-delay: 1s;
	transform-origin: top;
}
/* plane fly on click left + hold */
/* plane land when relese left click */
section:active .runway 
{
	transform: scaleX(0.7) scaleY(0);
	transition-delay: 0s;
	transform-origin: bottom;
}
section .runway::before 
{
	content: '';
	position: absolute;
	top: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 15px;
	height: 100%;
	background: repeating-linear-gradient(transparent 0%,transparent 50%,#fff 50%, #fff 100%);
	background-size: 20px 320px;
	animation: animateRunway 0.5s linear infinite;
}
/* add effect on 'left click on hold */
section:active .runway::before 
{
	animation: animateRunway 0.25s linear infinite;
}
@keyframes animateRunway 
{
	0% 
	{
		background-position-y: 0px;
	}
	100% 
	{
		background-position-y: 640px;
	}
}
.plane
{
	position: absolute;
	bottom: 100px;
	max-width: 300px;
	pointer-events: none;
	filter: drop-shadow(0px 0px 2px rgba(0,0,0,0.5));
	transition: 5s;
}
section:active .plane
{
	max-width: 500px;
	filter: drop-shadow(200px 200px 0 rgba(0,0,0,0));
}
.clouds 
{
	position: absolute;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 10000;
	pointer-events: none;
	opacity: 0;
	transition: opacity 2s;
	transition-delay: 0s;
}
section:active .clouds
{
	opacity: 1;
	transition-delay: 1s;
}
.clouds img 
{
	position: absolute;
	left: 0;
	width: 800px;
	animation: animateClouds 4s linear infinite;
	animation-delay: calc(-1.5s * var(--i));
}
.clouds2 
{
	right: 0;
	transform: rotate(180deg);
}
.clouds2 img  
{
	animation: animateClouds2 4s linear infinite;
	animation-delay: calc(-1.5s * var(--i));
}
@keyframes animateClouds 
{
	0%
	{
		transform: translateY(-100%);
	}
	100%
	{
		transform: translateY(100%);
	}
}
@keyframes animateClouds2 
{
	0%
	{
		transform: translateY(100%);
	}
	100%
	{
		transform: translateY(-100%);
	}
}


	
    </style>
</head>
<body>

    <section onclick="hello();">

		<audio
		autoplay
		controls
		loop
		id="audio"
		src="resources/airplane.mp3"
		style="display:none;"
	  ></audio>

        <!-- add clouds -->
        <div class="clouds">
            <img src="https://user-images.githubusercontent.com/102042383/179809901-8d70c657-0a6d-454b-94ee-8a9c16e70cb0.png" style="--i:1;">
            <img src="https://user-images.githubusercontent.com/102042383/179809909-20d6c160-8e06-4e00-9599-e5254440fcc0.png" style="--i:2;">
            <img src="https://user-images.githubusercontent.com/102042383/179809914-368f0253-a643-4a69-a785-7681ca5a3dd7.png" style="--i:3;">
        </div>
        <div class="clouds clouds2">
            <img src="https://user-images.githubusercontent.com/102042383/179809901-8d70c657-0a6d-454b-94ee-8a9c16e70cb0.png" style="--i:1;">
            <img src="https://user-images.githubusercontent.com/102042383/179809909-20d6c160-8e06-4e00-9599-e5254440fcc0.png" style="--i:2;">
            <img src="https://user-images.githubusercontent.com/102042383/179809914-368f0253-a643-4a69-a785-7681ca5a3dd7.png" style="--i:3;">
        </div>

        <div class="runway">
		</div>
        <img src="https://user-images.githubusercontent.com/102042383/179809936-ba0e7255-cb61-4847-9cd6-15af37378733.gif" onclick="open();" class="plane" >	
		
    </section>

	<script>

function hello()  {
  window.location.href = 'main2Page.co'
}
		
		</script>

<script>
const beeSound = document.getElementById("audio");
const [body] = document.getElementsByTagName("body");

function play() {
  if (!beeSound instanceof HTMLAudioElement) return;
  if (beeSound.paused) {
    beeSound.play();
  } else {
    body.removeEventListener("click", play);
  }
  console.log(beeSound.paused);
}
body.addEventListener("click", play);
</script>

</body>
</html>
