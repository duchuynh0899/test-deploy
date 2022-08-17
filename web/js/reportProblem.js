var next=document.querySelector(".continue");
var main=document.querySelectorAll(".main");
var back=document.querySelector(".fa-arrow-left");

let formnumber=0;


next.onclick=function(){
   
    formnumber++;
    updateform();
};

back.onclick=function(){
   
    formnumber--;
    updateform();
};


function updateform(){
    main.forEach(function(page){
        page.classList.add('hidden');
    });
    main[formnumber].classList.remove('hidden') ;
}