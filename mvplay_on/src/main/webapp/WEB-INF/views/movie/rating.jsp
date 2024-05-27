<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style>

.rating {
    float: none;
    width: 200px;
    display: flex;
}
.rating__input {
   display: none;
}

.rating__label {
   width: 20px;
   overflow: hidden;
   cursor: pointer;
}
.star-icon {
   width: 20px;
   height: 40px;
   display: block;
   position: relative;
   left: 0;
   background-image: url("/resources/icon/star-empty.svg");
   background-repeat: no-repeat;
   background-size: 40px;
}
         
.star-icon.filled {
   background-image: url("/resources/icon/star-fill.svg");
}

.rating__label--full .star-icon {
   background-position: right;
}

.rating__label--half .star-icon {
   background-position: left;
}


</style>


</head>
<body>


<div class="wrap">
    <form action="/movie/rating" method="post" id="ratingForm">
    <div class="rating">
        <label class="rating__label rating__label--half" for="starhalf">
            <input type="radio" id="starhalf" class="rating__input" name="rating" value="0.5">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star1">
            <input type="radio" id="star1" class="rating__input" name="rating" value="1">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star1half">
            <input type="radio" id="star1half" class="rating__input" name="rating" value="1.5">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star2">
            <input type="radio" id="star2" class="rating__input" name="rating" value="2">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star2half">
            <input type="radio" id="star2half" class="rating__input" name="rating" value="2.5">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star3">
            <input type="radio" id="star3" class="rating__input" name="rating" value="3">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star3half">
            <input type="radio" id="star3half" class="rating__input" name="rating" value="3.5">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star4">
            <input type="radio" id="star4" class="rating__input" name="rating" value="4">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--half" for="star4half">
            <input type="radio" id="star4half" class="rating__input" name="rating" value="4.5">
            <span class="star-icon"></span>
        </label>
        <label class="rating__label rating__label--full" for="star5">
            <input type="radio" id="star5" class="rating__input" name="rating" value="5">
            <span class="star-icon"></span>
        </label>
    </div>
    <span>취소</span>
    </form>
</div>




<script>

let ratingForm = $('#ratingForm');

const rateWrap = document.querySelectorAll('.rating'),
label = document.querySelectorAll('.rating .rating__label'),
input = document.querySelectorAll('.rating .rating__input'),
labelLength = label.length,
opacityHover = '0.5';

let stars = document.querySelectorAll('.rating .star-icon');

checkedRate();


rateWrap.forEach(wrap => {
wrap.addEventListener('mouseenter', () => {
    stars = wrap.querySelectorAll('.star-icon');

    stars.forEach((starIcon, idx) => {
        starIcon.addEventListener('mouseenter', () => {
            if (wrap.classList.contains('readonly') == false) {
                initStars(); // 기선택된 별점 무시하고 초기화
                filledRate(idx, labelLength);  // hover target만큼 별점 active

                // hover 시 active된 별점의 opacity 조정
                for (let i = 0; i < stars.length; i++) {
                    if (stars[i].classList.contains('filled')) {
                        stars[i].style.opacity = opacityHover;
                        
                        console.log("1111");
                    }
                }
            }
        });

        starIcon.addEventListener('mouseleave', () => {
            if (wrap.classList.contains('readonly') == false) {
                starIcon.style.opacity = '1';
                checkedRate(); // 체크된 라디오 버튼 만큼 별점 active
                
                console.log("22");
                /*ajax로 처리해야하는 듯*/
                
                /*예시::: 
					$.ajax({
							url: '/movie/rating',
							type : 'POST',
							dataType : 'json',
							success : function(result){
								console.log(result);
								showUploadImage(result);
							},
							error : function(result){
								alert("이미지 파일이 아닙니다.");
							}
						});
                
                */
                
                
                
                
                ratingForm.submit();
                
                
            }
        });

        // rate wrap을 벗어날 때 active된 별점의 opacity = 1
        wrap.addEventListener('mouseleave', () => {
            if (wrap.classList.contains('readonly') == false) {
                starIcon.style.opacity = '1';
                
                console.log("33");
            }
        });

        // readonly 일 때 비활성화
        wrap.addEventListener('click', (e) => {
            if (wrap.classList.contains('readonly')) {
                e.preventDefault();
                
               
                console.log("44");
                
            }
        });
    });
});
});

//target보다 인덱스가 낮은 .star-icon에 .filled 추가 (별점 구현)
function filledRate(index, length) {
    if (index <= length) {
        for (let i = 0; i <= index; i++) {
            stars[i].classList.add('filled');
            
            console.log("5");
        }
    }
}

//선택된 라디오버튼 이하 인덱스는 별점 active
function checkedRate() {
    let checkedRadio = document.querySelectorAll('.rating input[type="radio"]:checked');


    initStars();
    checkedRadio.forEach(radio => {
        let previousSiblings = prevAll(radio);

        for (let i = 0; i < previousSiblings.length; i++) {
            previousSiblings[i].querySelector('.star-icon').classList.add('filled');
            
            console.log("6");
        }

        radio.nextElementSibling.classList.add('filled');

        function prevAll() {
            let radioSiblings = [],
                prevSibling = radio.parentElement.previousElementSibling;

            while (prevSibling) {
                radioSiblings.push(prevSibling);
                prevSibling = prevSibling.previousElementSibling;
                
                console.log("7");
            }
            return radioSiblings;
        }
    });
}

//별점 초기화 (0)
function initStars() {
    for (let i = 0; i < stars.length; i++) {
        stars[i].classList.remove('filled');
    }
}

</script>
</body>
</html>