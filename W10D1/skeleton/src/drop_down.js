
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogs){
  let links = [];
  for(let dog in dogs){
    let tag = document.createElement("a");
    let name = document.createTextNode(dog);
    tag.appendChild(name);
    tag.setAttribute("href", dogs[dog]);
    let li = document.createElement("li");
    li.classList.add('dog-link');
    li.appendChild(tag);
    links.push(li);
  }
  return links; 
}

function attachDogLinks(){
  let dogLinks = dogLinkCreator(dogs);
  let list = document.getElementsByClassName("drop-down-dog-list");
  
  dogLinks.forEach((ele)=>{
    list[0].appendChild(ele);
  });
  
  
}

function handleEnter(){
  let links = document.getElementsByClassName("dog-link");
  links = Array.from(links);
  links.forEach((link)=>{
    link.classList.add("show-link")
  })
}

function handleLeave(){
  let links = document.getElementsByClassName("dog-link");
  links = Array.from(links);
  links.forEach((link) => {
    link.classList.remove("show-link")
  })
}

attachDogLinks();
let list = document.getElementsByClassName("drop-down-dog-nav");

list[0].addEventListener('mouseenter', handleEnter);
list[0].addEventListener('mouseleave', handleLeave);
