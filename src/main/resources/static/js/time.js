
//시계
const clock = document.querySelector('.h5-clock');


function getTime(){
    const time = new Date();
    const month = time.getMonth();
    const rday = time.getDay(); 
    const hour = time.getHours();
    const minutes = time.getMinutes();
    const seconds = time.getSeconds();
    //clock.innerHTML = hour +":" + minutes + ":"+seconds;
    clock.innerHTML = `${rday<10 ? `0${day}`:rday}:`${hour<10 ? `0${hour}`:hour}:${minutes<10 ? `0${minutes}`:minutes}:${seconds<10 ? `0${seconds}`:seconds}`
}


function init(){
    setInterval(getTime, 1000);
}

init();
