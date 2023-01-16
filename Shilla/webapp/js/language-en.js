/*  ---------------------------------------------------
    File Name: language
    Description: (AllPage) - traslate(English/Korean)
    Author: 이미나
---------------------------------------------------------  */
var lang = {
            en: {
            	// ** header **
            	hotel_tel: "(TEL) 82-2-2603 6789",
            	
            	language: "Language",
            	home: "Home",
            	rooms: "Rooms",
            	about_us: "About Us",
            	pages: "Pages",
            	room_details: "Room-Details",
            	blog_details: "Blog-Details",
            	event: "Event",
                contact_us: "Contact Us",
                contact: "Contact",
                inquiries: "Inquiries",
                account: "My Account",
                account_info: "My Profile",
                account_edit: "Edit Account",
                account_delete: "Delete Account",
                login: "Login",
                logout: "Logout",
                join: "Join",
                booking_btn: "Booking Now",
                booking_check: "Booking Check",
                read_more: "Read More",
                
                // ** login.jsp & join.jsp **
                id: "Id",
                pw: "Password",
                pw_check: "Confirm Passsword",
                name: "Name",
                age: "Age",
                tel: "Tel",
                gender: "Gender",
                man: "Man",
                woman: "Woman",
                email: "Email",
                duplicate_check: "Duplicate Check",
                
                // ** index.jsp **
                about_us_stay: "The Shilla Stay is a business hotel brand with which you can experience "
                			+"the Hotel Shilla's values at reasonable prices."
                			+" The Shilla Stay constituetes a space that adds a new sense to the values "
                			+"of the Hotel Shilla's products and services."
                			+" The Shilla Stay first seeks to understand what customers need and offers "
                			+"a selection of products and services which are truly meaningful to customers",
                home_text_before: "Excitement for those starting out on the journey Shilla Stay Gangseo",
                home_text_after: "providing a comfortable rest for the weary",
                terms_and_conditions: "Terms and Conditions",
                privacy_policy: "Privacy Policy",
                home_footer_text: "Hotel Shilla, as Korea's representative service company, is committed to customer satisfaction.",
                facilities: "Facilities",
                
                location_title: "Location",
                location_content: "Shilla Stay Gangseo, 9, Magokseo-ro, Gangseo-gu, Seoul, Republic of Korea",
                
                // ** aboutUs ** 
                save_btn: "Save",
                
                // ** rooms **
                room_standard: "Standard Room",
                room_suite: "Suite Room",
                room_executive: "Executive Room",
                room_korean: "Ondol(Korean Room)",
                room_location: "Location",
                room_size: "Size",
                room_detail_sub: "Detail",
                room_detail_con: "1 BedRoom, 1 BathRoom",
                room_detail_con2: "1 BedRoom, 1 BathRoom, 1 LoungeRoom",
                room_service_sub: "Service",
                room_service_con: "TV/Desk/Refrigerator/Etc",
                room_info: "Expect a highly relaxing experience with luxury bedding and amenities of Shilla Stay Gangseo.",
                
                // ** booking **
                last_month: "Last Month",
                next_month: "Next Month",
                day_sun: "Sun",
                day_mon: "Mon",
                day_tue: "Tue",
                day_wed: "Wed",
                day_thu: "Thu",
                day_fri: "Fri",
                day_sat: "Sat",
                check_availability: "Check Availability",
                check_booking: "Your Reservation",
                check_allBooking: "All Reservation",
                check_booking_info: "Please fill in the blanks",
                room_checkIn: "Check In",
                room_checkOut: "Check Out",
                room_schedule: "Schedule",
                room_type: "Room Type",
                room_price: "Room Price",
                noRoom_info: "No rooms available",
                noMem_booking_pay: "Booking for Non-Member",
                payment_complete: "The payment has been completed.",
                booking_number: "Booking Number",
                
                // ** event **
                event_thumbnail: "Thumbnail",
                edit_btn: "Edit",
                event_kategorie: "Kategorie",
                title: "Title",
                date_created: "Date Created",
                manager: "Manager",
                event_titleImg: "Edit Title Image",
                add_prologue: "Add Prologue",
                subtitle: "Subtitle",
                add_contents: "Add Contents",
                share: "Share : ",
                leave_a_comment: "Leave a Comment",
                recommended: "Recommended",
                comment_name: "Name",
                comment_list: "Comments",
                comment: "Comment",
                go_listBtn: "Back to List",

                // ** contact.html **
                contact_contents: "Call the main number of the hotel for inquiries about" 
               			 + "the use of hotel services, and you may receive a quicker reply.",
                contact_phone: "Phone	+82-2-2603-6789",
                contact_reservation: "Room reservations		+82-2-2603-6800",
                contact_time: "Weekdays(Monday-Friday) 09:00~18:00, Weekends and public holidays 09:00~16:00",
          
          		// ** inquiries.html **
          		inq_name: "* Name",
          		inq_email: "* Email",
          		inq_phone: "* Phone",
          		inq_sub: "* Subject",
          		inq_msg: "* Contents",
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
        
        // ******** Input Tag, Btn 언어처리 == Event **********
        var english = document.getElementById("en");
        var sendBtn = document.getElementById("sendBtn");
        var loginBtn = document.getElementById("loginBtn");
        var joinBtn = document.getElementById("joinBtn");
        var payBtn = document.getElementById("payBtn");
        var editBtn = document.getElementById("editBtn");
        var delBtn = document.getElementById("delBtn");
        var cxlBtn = document.getElementById("cxlBtn");
        var payBtn_mem = document.getElementById("payBtn_mem");
        var payBtn_noMem = document.getElementById("payBtn_noMem");
        
		if(english != null){
        	render("en");
        	if(sendBtn != null){ // sendBtn이 있는 문의하기 페이지의 버튼 글 바꾸기
        		document.getElementById("sendBtn").setAttribute("value","Submit");
       		}
       		if(loginBtn != null){
       			document.getElementById("loginBtn").setAttribute("value","Login");
       		}
       		if(joinBtn != null){
       			document.getElementById("joinBtn").setAttribute("value","Join");
       		}
       		if(payBtn != null){
       			document.getElementById("payBtn").setAttribute("value","To pay");
       		}
       		if(editBtn != null){
       			document.getElementById("editBtn").setAttribute("value","Edit");
       		}
       		if(delBtn != null){
       			document.getElementById("delBtn").setAttribute("value","Delete");
       		}
       		if(cxlBtn != null){
       			document.getElementById("cxlBtn").setAttribute("value","Cancel");
       		}
       		if(payBtn_mem != null){
       			document.getElementById("payBtn_mem").setAttribute("value","To Pay for Members");
       		}
       		if(payBtn_noMem != null){
       			document.getElementById("payBtn_noMem").setAttribute("value","To Pay for Non-Members");
       		}
     	}        
        