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

categories = Category.create!(
  [
  {name: '山'},
  {name: '森'},
  {name: '草原'},
  {name: '草木'},
  {name: '花'},
  {name: '生物'},
  {name: '海'},
  {name: '湖'},
  {name: '川'},
  {name: '空'},
  {name: 'その他'},
  ]
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
      }
  ]
)

PostImage.create!(
  [
    {
      title: '散歩先にて',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post1.jpg"), filename:"sample-post1.jpg"),
      caption: '小さくてかわいらしかったので撮影して見ました！',
      category_id: categories[4].id,
      end_user_id: users[0].id
      },

    {
      title: '小鳥',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post2.jpg"), filename:"sample-post2.jpg"),
      caption: 'いい感じに撮れたと思います。',
      category_id: categories[5].id,
      end_user_id: users[1].id
      },

    {
      title: '',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/sample_images/sample-post3.jpg"), filename:"sample-post3.jpg"),
      caption: '',
      category_id: categories[1].id,
      end_user_id: users[2].id
      }
  ]
)