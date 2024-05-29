<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
/*
.wrap {
    height: 100vh;
    min-height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 32px;
}
*/


.rating {
    float: none;
    width: 100px;
/*    width: 200px; */
    display: flex;
}
.rating__input {
   display: none;
}

.rating__label {
   width: 10px;
   overflow: hidden;
   cursor: pointer;
}
.star-icon {
   width: 10px;
   height: 20px;
   display: block;
   position: relative;
   left: 0;
   background-image: url("/resources/icon/star-empty.svg");
   background-repeat: no-repeat;
   background-size: 20px;
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

<div class="wrap">
    <form action="/movie/rating" method="post" id="ratingForm">
    <!-- 샘플 변경 예정 -->
    <input type="hidden" name="rating" value='<c:out value="${ratingInfo.rating }" />'>
    <input type="hidden" name="userId" value="${member.userId }">
    <input type="hidden" name="movieId" value="${movieInfo.movieId }">
    
    
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
//페이지가 로드될 때 실행되는 부분
$(document).ready(function() {
    // 별점 값 파싱
    let ratingValue = parseFloat('<c:out value="${ratingInfo.rating }" />'); // URL에서 별점 값 가져오기

    // 별점 값이 유효한지 확인 후 설정
    if (!isNaN(ratingValue) && ratingValue >= 0 && ratingValue <= 5) {
        setRating(ratingValue);
    }
});

// 별점을 설정하는 함수
function setRating(value) {
    let ratingIcons = document.querySelectorAll('.rating .star-icon');
    let ratingInputs = document.querySelectorAll('.rating .rating__input');

    // 선택된 별점 제거
    ratingIcons.forEach(icon => {
        icon.classList.remove('filled');
    });

    // 주어진 값에 해당하는 별점 선택
    let selectedRating = Math.round(value * 2) / 2; // 반올림하여 0.5 단위로 설정
    for (let i = 0; i < ratingInputs.length; i++) {
        let inputValue = parseFloat(ratingInputs[i].value);
        if (inputValue <= selectedRating) {
            ratingIcons[i].classList.add('filled');
        }
    }
}

//별점 선택 유지하는 부분 나중에 수정 예정




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
                    }
                }
            }
        });

        starIcon.addEventListener('mouseleave', () => {
            if (wrap.classList.contains('readonly') == false) {
                starIcon.style.opacity = '1';
                checkedRate(); // 체크된 라디오 버튼 만큼 별점 active
                
            }
        });

        // rate wrap을 벗어날 때 active된 별점의 opacity = 1
        wrap.addEventListener('mouseleave', () => {
            if (wrap.classList.contains('readonly') == false) {
                starIcon.style.opacity = '1';
            }
        });

        // readonly 일 때 비활성화
        wrap.addEventListener('click', (e) => {
            if (wrap.classList.contains('readonly')) {
                e.preventDefault();
               
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
        }
    }
}

//선택된 라디오버튼 이하 인덱스는 별점 active
function checkedRate() {
    let checkedRadio = document.querySelectorAll('.rating input[type="radio"]:checked');


    //initStars();
    checkedRadio.forEach(radio => {
        let previousSiblings = prevAll(radio);

        for (let i = 0; i < previousSiblings.length; i++) {
            previousSiblings[i].querySelector('.star-icon').classList.add('filled');
         }

        radio.nextElementSibling.classList.add('filled');

        function prevAll() {
            let radioSiblings = [],
                prevSibling = radio.parentElement.previousElementSibling;

            while (prevSibling) {
                radioSiblings.push(prevSibling);
                prevSibling = prevSibling.previousElementSibling;
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


stars.forEach((starIcon, idx) => {
    starIcon.addEventListener('click', () => {
        // 클릭된 별의 값
        const ratingValue = input[idx].value;
        
        // 폼에 별점 값 채우기
        document.getElementById("ratingForm").rating.value = ratingValue;
        
        // AJAX 요청 보내기
        let formData = new FormData();
		formData.append('rating', ratingValue); // 별점 값 추가
		//formData.append('userId', document.querySelector('[name="userId"]').value); // userId 추가
		//formData.append('movieId', document.querySelector('[name="movieId"]').value); // movieId 추가
        
		formData.append('userId', '${member.userId}'); // userId 추가
		formData.append('movieId','${movieInfo.movieId}' ); //movieId  
        
        
        //formData.append('#ratingForm').value  ////
        
        
        //ratingForm
        $.ajax({
            url: '/movie/rating', // 현재 페이지 유지
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            dataType: 'json',
            success: function(response) {
                console.log("평가가 성공적으로 전송되었습니다.");
                console.log("formdata", formData);
            },
            error: function (request, status, error) {
                console.log("code: " + request.status)
                console.log("message: " + request.responseText)
                console.log("error: " + error);
                //alert("로그인 해주세요.");
            
            }
        });
    });
});

</script>

