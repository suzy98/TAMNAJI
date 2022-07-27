<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url(&#34;
    https://fonts.googleapis.com/css?family=Libre+Franklin&#34;
    );
 body {
     margin: 0;
     min-height: 100vh;
     overflow: hidden;
     font-family: &#34;
    Libre Franklin&#34;
    , sans-serif;
     font-size: 62.5%;
     background-image: linear-gradient(0deg, #E8F4F8, lightblue);
}
 .error {
     position: absolute;
     top: 50%;
     left: 50%;
     transform: translate(-50%, -50%);
     display: flex;
     flex-direction: column;
     align-items: center;
     white-space: nowrap;
     text-transform: uppercase;
     font-size: 2rem;
     font-weight: 900;
     color: #fff;
     text-shadow: 10px 10px 50px #E6E6E6;
     opacity: 0.5;
     user-select: none;
}
 .error span {
     display: block;
}
 .error span:nth-child(2) {
     font-size: 10rem;
}
 .sun {
     position: absolute;
     top: 4em;
     left: 4em;
     width: 100px;
     height: 100px;
     border-radius: 50%;
     background-image: radial-gradient(circle at 50%, #fff 50%, #F5DE19);
     box-shadow: 0px 0px 40px #F5DE19, inset 0px 0px 100px #F5DE19;
     animation: sun 5s linear infinite;
}
 .clouds {
     position: absolute;
     right: 0;
     bottom: 35vh;
     left: 0;
     opacity: 0.5;
}
 .clouds div {
     position: relative;
     left: -30%;
     width: 220px;
     height: 80px;
     border-radius: 50%;
     background-color: #fff;
     background-image: radial-gradient(ellipse at 50%, transparent, #FCFCFC, #F7F7F7);
     filter: blur(3px);
     animation: clouds 60s linear infinite, cloud 8s linear infinite;
}
 .clouds div::before, .clouds div::after {
     position: absolute;
     content: &#34;
    &#34;
    ;
     width: inherit;
     height: inherit;
     border-radius: 50%;
     background-color: #F2F2F2;
     background-image: radial-gradient(ellipse at 50%, transparent, #F2F2F2, #F7F7F7);
     filter: blur(3px);
     animation: cloud 3s linear infinite;
}
 .clouds div::after {
     background-color: #E6E6E6;
}
 .clouds div:nth-child(2) {
     animation-delay: 5s;
}
 .clouds div:nth-child(3) {
     animation-duration: 40s;
}
 .birds {
     position: absolute;
     right: -10%;
     top: 30px;
     width: 10px;
     height: 10px;
     background-color: #070000;
     clip-path: polygon(70% 59%, 100% 54%, 64% 68%, 48% 83%, 81% 86%, 55% 90%, 0 92%, 19% 76%, 0 60%, 33% 71%);
     animation: birds 30s linear infinite, fly 1s linear infinite;
}
 .sea {
     position: absolute;
     right: 0;
     bottom: 0;
     left: 0;
     z-index: -1;
     height: 25vh;
     background-color: lightblue;
}
 .fish {
     position: relative;
}
 .fish span {
     position: relative;
     top: 10%;
     left: 110%;
     display: block;
     width: 50px;
     height: 16px;
     background-color: #3A9FC0;
     background-image: linear-gradient(to top, #92CBDE, #3A9FC0);
     border-radius: 52% 48% 51% 49% / 51% 56% 44% 49%;
     animation: fish 15s linear infinite;
}
 .fish span::before, .fish span::after {
     position: absolute;
     content: &#34;
    &#34;
    ;
}
 .fish span::before {
     left: 95%;
     top: calc(50% - 8px);
     width: 16px;
     height: 16px;
     background-color: inherit;
     background-image: linear-gradient(90deg, #3A9FC0, #2B758D);
     clip-path: polygon(100% 0%, 84% 49%, 100% 100%, 0 66%, 0% 50%, 0 35%);
}
 .fish span::after {
     width: 10px;
     height: 10px;
     top: 50%;
     left: 30%;
     background-image: linear-gradient(135deg, #3A9FC0, #2B758D);
     clip-path: polygon(100% 27%, 86% 74%, 31% 100%, 0 22%, 0 0, 35% 0);
     transform-origin: 0 0;
     animation: side 0.5s linear infinite;
}
 .fish span:nth-child(2) {
     animation-duration: 6s;
     animation-delay: 5s;
}
 .fish span:nth-child(3) {
     animation-duration: 9s;
}
 .wave {
     position: absolute;
     left: -25%;
     bottom: 0;
     width: 150%;
     height: 100%;
     background-color: lightblue;
     animation: vawe 20s linear infinite;
}
 .wave.w-1 {
     background: #99CFE0;
     animation-delay: 2s;
}
 .wave.w-2 {
     background: #86C5DA;
}
 .bottom {
     position: absolute;
     right: -2em;
     bottom: 0;
     left: -2em;
     height: 1.35em;
     border-radius: 78% 22% 52% 48% / 100% 100% 0% 0%;
     background-color: #3A0003;
     background-image: linear-gradient(0deg, #210001, #6D0005);
     opacity: 0.8;
}
 .grass {
     position: absolute;
     bottom: 5px;
     left: 5em;
     width: 3px;
     height: 35px;
     background-color: #44882D;
     background-image: linear-gradient(45deg, #44882D, #274F1A);
     border-radius: 40%;
     transform-origin: 50% 100%;
     animation: grass 2s linear infinite;
}
 .grass:nth-child(2) {
     bottom: 3px;
     left: 30%;
}
 .grass:nth-child(3) {
     bottom: 8px;
     left: 60%;
}
 .grass:nth-child(4) {
     bottom: 6px;
     left: 80%;
}
 .grass span {
     position: absolute;
     left: -5px;
     width: 8px;
     height: 2px;
     background-color: #44882D;
     background-image: inherit;
     transform: rotate(45deg);
}
 .grass span::before {
     position: absolute;
     top: 4px;
     left: 4px;
     content: &#34;
    &#34;
    ;
     width: inherit;
     height: inherit;
     background-color: inherit;
     transform: rotate(-90deg) translateX(100%);
}
 .grass span:nth-child(2) {
     top: 10px;
}
 .grass span:nth-child(3) {
     top: 15px;
}
 .grass span:nth-child(3) {
     top: 20px;
}
 .circle {
     position: absolute;
     bottom: 5px;
     left: 0;
     width: 100%;
     height: 25vh;
}
 .circle span {
     position: absolute;
     bottom: 0;
     left: 12%;
     display: block;
     width: 7px;
     height: 7px;
     border-radius: 50%;
     background-color: #fff;
     opacity: 0.2;
     animation: circle 2s linear infinite;
}
 .circle span::before, .circle span::after {
     position: absolute;
     bottom: 0;
     left: 10px;
     content: &#34;
    &#34;
    ;
     width: 5px;
     height: 5px;
     border-radius: inherit;
     background-color: inherit;
     animation: circle 4s linear infinite;
     animation-delay: 0.3s;
}
 .circle span::after {
     right: -10px;
     animation-delay: 0.5s;
}
 .circle span:nth-child(2) {
     left: 25%;
     animation-delay: 0.6s;
}
 .circle span:nth-child(3) {
     left: 45%;
     animation-delay: 0.8s;
}
 .circle span:nth-child(4) {
     left: 53%;
}
 .circle span:nth-child(5) {
     left: 74%;
}
 .grass_tw {
     position: absolute;
     bottom: 11px;
     left: 50%;
     width: 30px;
     height: 10px;
     background-color: #44882D;
     background-image: linear-gradient(180deg, #44882D, #1E3B14);
     clip-path: polygon(10% 84%, 14% 73%, 17% 24%, 20% 61%, 22% 88%, 32% 15%, 31% 68%, 35% 88%, 49% 11%, 63% 85%, 69% 10%, 77% 80%, 84% 16%, 89% 92%, 97% 41%, 100% 97%, 50% 96%, 0 100%, 4% 34%);
     animation: grass_tw 2s linear infinite;
}
 .grass_tw:nth-last-child(2) {
     left: 75%;
     width: 80px;
}
 .grass_tw:last-child {
     bottom: 8px;
     left: 20%;
     width: 50px;
}
 @keyframes sun {
     50% {
         box-shadow: 0px 0px 60px 20px #F5DE19, inset 0px 0px 100px #F5DE19;
    }
}
 @keyframes clouds {
     0% {
         left: -30%;
    }
     100% {
         left: 110%;
    }
}
 @keyframes cloud {
     30% {
         border-radius: 22% 78% 51% 49% / 78% 66% 34% 22%;
    }
     40% {
         width: 180px;
    }
     60% {
         border-radius: 61% 39% 51% 49% / 50% 66% 34% 50%;
    }
}
 @keyframes birds {
     100% {
         right: 110%;
         transform: scale(1.8) translateY(100px);
    }
}
 @keyframes fly {
     50% {
         clip-path: polygon(70% 69%, 97% 80%, 70% 76%, 48% 83%, 81% 86%, 55% 90%, 0 92%, 19% 76%, 0 71%, 33% 71%);
    }
}
 @keyframes fish {
     0% {
         left: 110%;
    }
     40% {
         transform: translateY(35px) rotate(-15deg);
    }
     70% {
         transform: translateY(-5px) rotate(15deg);
    }
     80% {
         transform: translateY(5px) rotate(0deg);
    }
     100% {
         left: -10%;
    }
}
 @keyframes circle {
     0% {
         transform: translateY(0px) scale(0);
    }
     50%, 80% {
         transform: translateY(-25px) scale(1);
    }
     100% {
         transform: translateY(-30px) scale(0);
         opacity: 0;
    }
}
 @keyframes side {
     50% {
         transform: rotate(-35deg);
    }
}
 @keyframes vawe {
     20%, 40% {
         border-radius: 23% 77% 52% 48% / 100% 100% 0% 0%;
    }
     30%, 50%, 70% {
         border-radius: 37% 63% 100% 0% / 100% 100% 0% 0%;
    }
     80%, 60% {
         border-radius: 78% 22% 52% 48% / 100% 100% 0% 0%;
    }
}
 @keyframes grass {
     50% {
         transform: rotate(5deg);
    }
}
 @keyframes grass_tw {
     50% {
         clip-path: polygon(10% 84%, 14% 73%, 10% 28%, 20% 61%, 22% 88%, 24% 18%, 31% 68%, 35% 88%, 42% 15%, 63% 85%, 58% 14%, 77% 80%, 77% 18%, 89% 92%, 91% 43%, 100% 97%, 50% 96%, 0 100%, 3% 39%);
    }
}
#back {
    background-color: white;
    border: none;
    font-size: 30px;
    border-radius: 50px;
    padding: 20px;
    color: #2B758D;
    text-align: center;
}
*{ cursor: url('data:image/x-icon;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////v////5////+f////n////4D///+D////j////x////w///HwP//jwH//4gB/gAAAfwAAAP/AAAH/wAAD/8AAB//gAA//8AA///4A////4H////A////8H/9/////f////3////8P//////////////////////////////8='), auto; }
    </style>
</head>
<body>
    <div class="error"> <span>앗! 잘못된 접근이에요</span><span>ERROR</span><span></span>
    	<span><input id="back" value="이전 페이지로 돌아가기" onclick="javascript:history.go(-1);" readonly></span>
    </div>
	    
<div class="sun"></div>
<div class="clouds">
    <div></div>
    <div></div>
    <div></div>
</div>
<div class="birds"></div>
<div class="sea">
    <div class="wave w-1"></div>
    <div class="wave w-2"></div>
    <div class="fish"><span></span><span></span><span></span></div>
</div>
<div class="bottom">
    <div class="grass"><span> </span><span> </span><span> </span></div>
    <div class="grass"><span> </span><span> </span><span> </span></div>
    <div class="grass"><span> </span><span> </span><span> </span></div>
    <div class="grass"><span> </span><span> </span><span> </span></div>
    <div class="circle"><span></span><span></span><span></span><span></span><span></span></div>
    <div class="circle"><span></span><span></span><span></span><span></span><span></span></div>
    <div class="circle"><span></span><span></span><span></span><span></span><span></span></div>
    <div class="circle"><span></span><span></span><span></span><span></span><span></span></div>
    <div class="grass_tw"></div>
    <div class="grass_tw"></div>
    <div class="grass_tw"></div>
</div>
</body>
</html>