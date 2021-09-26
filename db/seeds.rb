# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Admin",
            email: "admin@gmail.com",
            password:"123456",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

Screen.create!(name:"phong 1", total_seat: 50)
Show.create!(movie_id: 2, screen_id: 1, start_time:'13:00'  , end_time: '15:20', date: '2021-9-30' )
Show.create!(movie_id: 2, screen_id: 1, start_time:'18:00'  , end_time: '20:20', date: '2021-9-30' )
Show.create!(movie_id: 2, screen_id: 1, start_time:'10:00'  , end_time: '12:20', date: '2021-9-30' )
5.times do |x|
    10.times do |z|
      CinenmaSeat.create(row: x+1, seat_number: z+1, screen_id: 1, price: 100)
    end
end

Genre.create!(name: "action")
Genre.create!(name: "Horror")
Genre.create!(name: "comedy")

Movie.create!(name: "Ban tay diet quy", title: "Su gia cua chua", 
    cast: " Park Seo Joon, Ahn Sung Ki, Woo Do Hwan, Choi Woo Sik…", time: "128",
    description: "Sau khi bản thân bỗng nhiên sở hữu “Bàn tay diệt quỷ”, võ sĩ MMA Yong Hoo (Park Seo Joon thủ vai) đã dấn thân vào hành trình trừ tà, 
    trục quỷ đối đầu với Giám Mục Bóng Tối (Woo Do Hwan) – tên quỷ Satan đột lốt người. Từ đó sự thật về cái chết của cha Yong Hoo cũng dần được hé lộ 
    cũng như nguyên nhân anh trở thành “người được chọn”.",
    release: Time.zone.now, genre_id: 1,
    image_link: "https://www.cgv.vn/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/b/_/b_n_tay_di_t_qu__teaser_poster.jpg")
Movie.create!(name: "MORTAL KOMBAT: CUỘC CHIẾN SINH TỬ", title: "MORTAL KOMBAT: CUỘC CHIẾN SINH TỬ", 
    cast: "  Lewis Tan, Jessica McNamee, Josh Lawson, Joe Taslim, Tadanobu Asano, Mehcad Brooks", time: "110 phút",
    description: "Mortal Kombat: Cuộc Chiến Sinh Tử xoay quanh võ sĩ võ thuật tổng hợp Cole Young (Lewis Tan),
    người mang trên mình một vết chàm rồng đen bí ẩn - biểu tượng của Mortal Kombat. Cole Young không hề biết về dòng máu bí ẩn đang chảy trong người anh,
    hay vì sao anh lại bị tên sát thủ Sub-Zero (Joe Taslim) săn lùng. Vì sự an nguy của gia đình,
    Cole cùng với một nhóm những chiến binh đã được tuyển chọn để tham gia vào một trận chiến đẫm máu nhằm chống lại những kẻ thù đến từ Outworld.",
    release: Time.zone.now, genre_id: 2,
    image_link: "https://cdn.moveek.com/media/cache/tall/6064676db9b81138200411.jpeg")
Movie.create!(name: "ĐIỆP VIÊN SIÊU LẦY", title: "My Spy (Điệp viên siêu lầy) ", 
    cast: " Dave Bautista, Chloe Coleman, Kristen Schaal, Ken Jeongs", time: "118",
    description: "Jason Jones, hay còn gọi là JJ (Dave Bautista) – một điệp viên CIA dày dạn kinh nghiệm. Trong một lần thực địa, JJ bị cô bé 9 tuổi 
    Sophie (Chloe Coleman) phát hiện và uy hiếp anh phải “gia sư” môn điệp viên cho mình nếu không muốn cả thế giới biết thân phận thực sự của anh. Mắc kẹt 
    bên cô học trò lắm mưu nhiều mẹo, JJ dần phát hiện ra Sophie thực sự có tố chất và năng khiếu bẩm sinh cho việc trở thành điệp viên. (CHIẾU LẠI từ 5/5/21)",
    release: Time.zone.now, genre_id: 3,
    image_link: "https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/m/a/main-poster_ms1.jpg")
Movie.create!(name: "GODZILLA VS. KONG", title: "GODZILLA đại chiến KONG", 
    cast: " Millie Bobby Brown, Alexander Skarsgård, Rebecca Hall, Eiza González, Kyle Chandler", time: "113 phút",
    description: "Khi hai kẻ thù truyền kiếp gặp nhau trong một trận chiến ngoạn mục, số phận của cả thế giới vẫn còn bị bỏ ngỏ… Bị đưa khỏi Đảo Đầu Lâu,
    Kong cùng Jia, một cô bé mồ côi có mối liên kết mạnh mẽ với mình và đội bảo vệ đặc biệt hướng về mái nhà mới. Bất ngờ, nhóm đụng độ phải Godzilla hùng mạnh,
    tạo ra một làn sóng hủy diệt trên toàn cầu. Thực chất, cuộc chiến giữa hai kẻ khổng lồ dưới sự thao túng của các thế lực vô hình 
    mới chỉ là điểm khởi đầu để khám phá những bí ẩn nằm sâu trong tâm Trái đất.",
    release: Time.zone.now, genre_id: 1,
    image_link: "https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/g/o/godzilla_vs_1_.jpg")
10.times do |x|
        Movie.create(name: Faker::Movie.title, title: Faker::Movie.title, time:"153 phút" , cast: Faker::Movies::BackToTheFuture.character,
        image_link: "https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/g/o/godzilla_vs_1_.jpg", 
        description: "description", release: Faker::Date.in_date_period, genre_id: Random.rand(1..3))
end
