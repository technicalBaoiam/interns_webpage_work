const card = document.querySelectorAll('.hire-us-card');
const cardContent = document.querySelectorAll('.hire-us-content');

const firstJob=document.querySelector('.first-job');
const secondJob=document.querySelector('.second-job');
const thirdJob=document.querySelector('.third-job');
const fourthJob=document.querySelector('.fourth-job');
const fifthJob=document.querySelector('.fifth-job');
const sixthJob=document.querySelector('.sixth-job');
const firstJobRoles=document.querySelector('.first-job-roles');
const secondJobRoles=document.querySelector('.second-job-roles');
const thirdJobRoles=document.querySelector('.third-job-roles');
const fourthJobRoles=document.querySelector('.fourth-job-roles');
const fifthJobRoles=document.querySelector('.fifth-job-roles');
const sixthJobRoles=document.querySelector('.sixth-job-roles');


setInterval(function () {document.getElementById("rbtn").click();}, 5000);
// card info in the info and form section
for (let i = 0; i < card.length; i++) {
    card[i].addEventListener("click", function() {
      card[i].classList.toggle("card-height-increase");
      cardContent[i].classList.toggle("card-content-animation")
    });
}

// selecting the jobs in job-roles table
secondJobRoles.style.display="none";
thirdJobRoles.style.display="none";
fourthJobRoles.style.display="none";
fifthJobRoles.style.display="none";
sixthJobRoles.style.display="none";

$(document).on('click','.jobs', function(){
  $(this).addClass('active').siblings().removeClass('active');
  if(firstJob.classList.contains('active')){
    firstJobRoles.style.display="";
    secondJobRoles.style.display="none";
    thirdJobRoles.style.display="none";
    fourthJobRoles.style.display="none";
    fifthJobRoles.style.display="none";
    sixthJobRoles.style.display="none";
  }
  else if(secondJob.classList.contains('active')){
    firstJobRoles.style.display="none";
    secondJobRoles.style.display="";
    thirdJobRoles.style.display="none";
    fourthJobRoles.style.display="none";
    fifthJobRoles.style.display="none";
    sixthJobRoles.style.display="none";
  }
  else if(thirdJob.classList.contains('active')){
    firstJobRoles.style.display="none";
    secondJobRoles.style.display="none";
    thirdJobRoles.style.display="";
    fourthJobRoles.style.display="none";
    fifthJobRoles.style.display="none";
    sixthJobRoles.style.display="none";
  }
  else if(fourthJob.classList.contains('active')){
    firstJobRoles.style.display="none";
    secondJobRoles.style.display="none";
    thirdJobRoles.style.display="none";
    fourthJobRoles.style.display="";
    fifthJobRoles.style.display="none";
    sixthJobRoles.style.display="none";

  }
  else if(fifthJob.classList.contains('active')){
    firstJobRoles.style.display="none";
    secondJobRoles.style.display="none";
    thirdJobRoles.style.display="none";
    fourthJobRoles.style.display="none";
    fifthJobRoles.style.display="";
    sixthJobRoles.style.display="none";
  }
  else if(sixthJob.classList.contains('active')){
    firstJobRoles.style.display="none";
    secondJobRoles.style.display="none";
    thirdJobRoles.style.display="none";
    fourthJobRoles.style.display="none";
    fifthJobRoles.style.display="none";
    sixthJobRoles.style.display="";

  }
})

// Reviews cards
const reviews = [
  {
    id: 1,
    name: "susan smith",
    job: "designation and company name",
    img:
      "./images/pexels-andrea-piacquadio-874158.jpg",
    text:
      "I'm baby meggings twee health goth +1. Bicycle rights tumeric chartreuse before they sold out chambray pop-up. Shaman humblebrag pickled coloring book salvia hoodie, cold-pressed four dollar toast everyday carrythundercats lumbersexual blue bottle. Disrupt glossier gastropub deep v vice franzen hell of brooklyn twee enamel pin fashion axe.photo booth jean shorts artisan narwhal. ",
  },
  {
    id: 2,
    name: "anna johnson",
    job: "designation and company name",
    img:
      "./images/pexels-justin-shaifer-1222271.jpg",
    text:
      "Helvetica artisan kinfolk thundercats lumbersexual blue bottle. Disrupt glossier gastropub deep v vice franzen hell of brooklyn twee enamel pin fashion axe.photo booth jean shorts artisan narwhal. thundercats lumbersexual blue bottle. Disrupt glossier gastropub deep v vice franzen hell of brooklyn twee enamel pin fashion axe.photo booth jean shorts artisan narwhal. ",
  },
  {
    id: 3,
    name: "peter jones",
    job: "designation and company name",
    img:
      "./images/pexels-pixabay-220453.jpg",
    text:
      "Sriracha literally flexitarian irony, vape marfa unicorn. Glossier tattooed 8-bit, fixie waistcoat offal activated charcoal slow-carb marfa hell of pabst racl thundercats lumbersexual blue bottle. Disrupt glossier gastropub deep v vice franzen hell of brooklyn twee enamel pin fashion axe.photo booth jean shorts artisan narwhal. ette post-ironic jianbing swag.",
  },
  {
    id: 4,
    name: "bill anderson",
    job: "designation and company name",
    img:
      "./images/pexels-simon-robben-614810.jpg",
    text:
      "Edison bulb put a bird on it humblebrag, marfa pok pok heirloom fashion axe cray stumptown venmo actually seitan. VHS farm-to-table schlitz, edison bulb pop-up 3 wolf moon tote bag street art shabby chic. thundercats lumbersexual blue bottle. Disrupt glossier gastropub deep v vice franzen hell of brooklyn twee enamel pin fashion axe.photo booth jean shorts artisan narwhal.  ",
  }
];

const image=document.querySelector(".review-image");
const namee=document.querySelector(".review-name");
const job=document.querySelector(".review-title");
const info=document.querySelector(".review-info");
const leftBtn=document.querySelector(".left-btn");
const rightBtn=document.querySelector(".right-btn");

let curr=0;

window.addEventListener("DOMContentLoaded",replace());
leftBtn.addEventListener("click",function(){
curr--;
if(curr<0){
  curr=reviews.length-1;
}
replace();
});

rightBtn.addEventListener("click",function(){
  curr++;
  if(curr >= reviews.length){
      curr=0;
  }
  replace();
});

function replace(){
/*The face alignment in the image differs for every second element.
Hence, to display the face properly, this if-else condition is used.*/
// if(curr%2==0){
//   image.style.top="-85px";
// }
// else{
//   image.style.top="-30px";
// }
  image.src=reviews[curr].img;
  namee.textContent=reviews[curr].name;
  job.textContent=reviews[curr].job;
  info.textContent=reviews[curr].text;
}