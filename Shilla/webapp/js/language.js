/*  ---------------------------------------------------
    File Name: language
    Description: (AllPage) - traslate(English/Korean)
    Author: 이미나
---------------------------------------------------------  */
var lang = {
            ko: {
            	// ** header **
            	hotel_tel: "(02) 2603 6789",
            	
            	language: "언어설정",
            	home: "홈",
            	rooms: "객실 종류",
            	about_us: "호텔 소개",
            	room_details: "객실 소개",
            	blog_details: "블로그 소개",
            	event: "이벤트",
                contact_us: "고객문의",
                contact: "연락처",
                inquiries: "문의하기",
                account: "나의 계정",
                account_info: "회원정보 확인",
                account_edit: "회원정보 수정",
                account_delete: "회원 탈퇴하기",
                login: "로그인",
                logout: "로그아웃",
                join: "회원가입",
                booking_btn: "객실 예약하기", 
                booking_check: "예약 확인하기",
                read_more: "더 보기",
                
                // ** login.jsp & join.jsp **
                id: "아이디",
                pw: "비밀번호",
                pw_check: "비밀번호확인",
                name: "이름",
                age: "나이",
                tel: "연락처",
                gender: "성별",
                man: "남자",
                woman: "여자",
                email: "이메일",
                duplicate_check: "중복확인",
                
                // ** index.jsp **
                about_us_stay: "'신라스테이'는 합리적인 가격에 신라 호텔의 가치를 경험할 수 있는 비즈니스 호텔로 "+
                	"신라호텔의 상품과 서비스 가치 위에 새로운 감성을 더한 공간입니다."+
                	" 신라스테이는 고객의 니즈를 먼저 이해하며, 고객에게 진정으로 의미 있는 상품과 서비스를 제공합니다.",
                home_text_before: "여행을 시작하는 이에게는 설렘을",
                home_text_after: "지친 이에게는 편안한 휴식을 제공하는 신라스테이 강서",
                terms_and_conditions: "이용약관",
                privacy_policy: "개인정보 처리방침",
                home_footer_text: "'호텔 신라'는 한국을 대표하는 서비스 기업으로서 고객만족에 최선을 다하고 있습니다.",
                facilities: "부대시설",
                location_title: "호텔위치",
                location_content: "서울특별시 강서구 마곡서로 9 호텔 신라스테이 강서",
                
                // ** 호텔소개 페이지 **
                save_btn: "저장하기",
                
                // ** 객실종류 페이지 **
                room_standard: "스탠다드",
                room_suite: "스위트",
                room_executive: "이그제큐티브",
                room_korean: "온돌",
                room_location: "객실 위치",
                room_size: "객실 크기",
                room_detail_sub: "구성",
                room_detail_con: "침실 1, 욕실 1",
                room_detail_con2: "침실 1, 욕실 1, 라운지룸 1",
                room_service_sub: "객실이용",
                room_service_con: "TV / 책상 / 냉장고 /기타",
                room_info: "신라 스테이 강서의 고급 침구와 어메니티로 편안한 휴식을 경험하세요.",
                
                // ** 예약 페이지 **
                year: "년",
                month: "월",
                day_sun: "일",
                day_mon: "월",
                day_tue: "화",
                day_wed: "수",
                day_thu: "목",
                day_fri: "금",
                day_sat: "토",
				last_month: "이전 달",
				next_month: "다음 달",                
                check_availability: "예약 가능한 객실 확인하기",
                check_booking: "예약 정보",
                check_allBooking: "모든 예약 정보",
                check_booking_info: "예약 정보를 입력해주세요",
                noRoom_info: "예약 가능한 객실이 없습니다.",
                room_checkIn: "체크인",
                room_checkOut: "체크아웃",
                room_schedule: "일정",
                room_type: "객실 타입",
                room_price: "객실 가격",
                noMem_booking_pay: "비회원 결제",
                payment_complete: "결제가 완료되었습니다.",
                booking_number: "예약 번호",
                
                // ** 이벤트 페이지 **
                event_thumbnail: "대표 이미지",
                edit_btn: "수정하기",
                event_kategorie: "카테고리",
                title: "제목",
                date_created: "작성 날짜",
                manager: "담당자",
                event_titleImg: "상단 이미지 변경하기",
                add_prologue: "프롤로그 작성",
                subtitle: "소제목",
                add_contents: "내용 작성",
                share: "공유 : ",
                leave_a_comment: "댓글을 남겨주세요",
                recommended: "추천",
                comment_name: "작성자",
                comment_list: "댓글 목록",
                comment: "댓글내용",
                go_listBtn: "목록으로",
                
                // ** 연락처 페이지 **
                contact_contents: "호텔 이용에 관한 문의는 대표전화를 이용하시면 더욱 빠르게 답변을 받으실 수 있습니다.",
                contact_phone: "대표전화	(02) 2603 6789",
                contact_reservation: "객실예약		(02) 2603 6800",
                contact_time: "평일(월-금) 09:00~18:00, 주말 및 공휴일 09:00~16:00",
                
                // ** 문의하기 페이지 **
                inq_name: "* 성명",
                inq_email: "* 이메일",
          		inq_phone: "* 전화번호",
          		inq_sub: "* 제목",
          		inq_msg: "* 내용",
            }
        }

        // 언어별 렌더링
        function render(locale) {
            const $lang = document.querySelectorAll("[data-lang]")
            $lang.forEach(el => {
                const code = el.dataset.lang
                el.textContent = lang[locale][code]
            })
        }
        
        // ******** session에 의한 언어처리 **********
        var korean = document.getElementById("ko");
        
        if(korean != null){
        	render("ko");
        }  
        