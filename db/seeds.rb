# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'a@a',
  password: 'aaaaaa'
)

users = EndUser.create!(
  [
    {
      email: 'h@h',
      name: 'heisei',
      password: 'hhhhhh',
      introduction: 'よろしくお願いします！',
      is_active: 'true',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-user1.jpeg"), filename:"sample-user1.jpeg")
      },

    {
      email: 's@s',
      name: 'showa',
      password: 'ssssss',
      introduction: '写真が趣味です。',
      is_active: 'true',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-user2.jpeg"), filename:"sample-user2.jpeg")
      },

    {
      email: 'r@r',
      name: 'reiwa',
      password: 'rrrrrr',
      introduction: '',
      is_active: 'true',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-user3.jpeg"), filename:"sample-user3.jpeg")
      },

    {
      email: 't@t',
      name: 'taisho',
      password: 'tttttt',
      introduction: '',
      is_active: 'false',
      },
  ]
)

post_images = PostImage.create!(
  [
    {
      title: '散歩先にて',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post1.jpg"), filename:"sample-post1.jpg"),
      caption: '小さくてかわいらしかったので撮影して見ました！',
      end_user_id: users[0].id
      },

    {
      title: '小鳥',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post2.jpg"), filename:"sample-post2.jpg"),
      caption: 'いい感じに撮れたと思います。',
      end_user_id: users[1].id
      },

    {
      title: '',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post3.jpg"), filename:"sample-post3.jpg"),
      caption: '',
      end_user_id: users[2].id
      },

    {
      title: 'キレイな夕焼けでした！',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post4.jpg"), filename:"sample-post4.jpg"),
      caption: '仕事帰りにて一枚！',
      end_user_id: users[0].id
      },

    {
      title: '緑',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post5.jpg"), filename:"sample-post5.jpg"),
      caption: '先日、訪れたのですが、とても広大で緑豊かな土地でした。',
      end_user_id: users[1].id
      },

    {
      title: '',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post6.jpg"), filename:"sample-post6.jpg"),
      caption: '海外旅行に行ったときに撮ったものです。',
      end_user_id: users[3].id
      },
  ]
)