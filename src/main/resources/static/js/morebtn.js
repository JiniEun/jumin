        window.onload=function(){
        const moreBtn=document.querySelector('.description .contents .moreBtn');
        const sub_detail=document.querySelector('.description .contents .detail');

        moreBtn.addEventListener('click',() =>{
            moreBtn.classList.toggle('clicked');
            sub_detail.classList.toggle('detail_clamp');
        });}