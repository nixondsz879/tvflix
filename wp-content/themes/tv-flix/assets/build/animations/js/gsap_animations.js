gsap.to(".header__logo", {duration: 0.5, opacity: 1, rotationX: 360});

gsap.from(".header__menu li a", {
  duration: 2,
  scale: 0.5, 
  opacity: 0, 
  delay: 0.5, 
  stagger: 0.2,
  ease: "elastic", 
  force3D: true
});

jQuery(document).ready(function(){
	gsap.from(".movieItem", 1, {
		scale: 0, 
		y: 60,
		//yoyo: true, 
		//repeat: -1, 
		ease: "power1.inOut",
		delay:1,
		stagger: {
		  amount: 0.5, 
		  grid: "auto",
		  from: "center"
		}
	});
});