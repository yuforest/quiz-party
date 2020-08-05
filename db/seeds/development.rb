ActiveRecord::Base.transaction do
  [
    { email: "test@gmail.com", password: "JIjUG1tTCTfPd3VL", password_confirmation: "JIjUG1tTCTfPd3VL" },
  ].each do |item|
    admin = Admin.new(item)
    admin.save!
  end

  [
    {
      email: "test@gmail.com",
      password: "ntsXwic6EFuG7CHH",
      password_confirmation: "ntsXwic6EFuG7CHH",
       profile: {name: "小学生", image: Rails.root.to_s + "/public/seeds/imgs/users/user1.jpg"}
    },
    {
      email: "test1@gmail.com",
      password: "Ha7mRDYivClyjca6",
      password_confirmation: "Ha7mRDYivClyjca6",
      profile: {name: "あめ", image: Rails.root.to_s + "/public/seeds/imgs/users/user2.jpg"}
    },
    {
      email: "test2@gmail.com",
      password: "aBgQWm4jyUlW2KPu",
      password_confirmation: "aBgQWm4jyUlW2KPu",
      profile: {name: "田中", image: Rails.root.to_s + "/public/seeds/imgs/users/user3.jpg"}
    },
    {
      email: "test3@gmail.com",
      password: "aZgW5gJQf0jny58n",
      password_confirmation: "aZgW5gJQf0jny58n",
      profile: {name: "Kuizer", image: Rails.root.to_s + "/public/seeds/imgs/users/user4.jpg"}
    },
    {
      email: "test4@gmail.com",
      password: "msrbW1HhZ44UYcsf",
      password_confirmation: "msrbW1HhZ44UYcsf",
      profile: {name: "Quiz King", image: Rails.root.to_s + "/public/seeds/imgs/users/user5.jpg"}
    }
  ].each do |u|
    user = User.new(u.except(:profile))
    user.skip_confirmation!
    user.save!
    profile = user.user_profile
    profile.name = u[:profile][:name]
    profile.image = File.open(u[:profile][:image])
    profile.save!
  end
  [
    { id: 1, name: "その他", slug: 'other' },
    { id: 2, name: "なぞなぞ", slug: 'riddle' },
    { id: 3, name: "語学", slug: 'language' },
    { id: 4, name: "理数系", slug:'science' },
    { id: 5, name: "スポーツ", slug: 'sport' },
    { id: 6, name: "芸能", slug: 'entertainment' },
    { id: 7, name: "食べ物", slug: 'food' },
    { id: 8, name: "歴史", slug: 'history' },
    { id: 9, name: "芸術", slug: 'art' },
    { id: 10, name: "地理", slug: 'geography' },
    { id: 11, name: "音楽", slug: 'music' },
    { id: 12, name: "アニメ・ゲーム・漫画", slug: 'anime' },
    { id: 13, name: "経済・ファイナンス", slug: 'economy' },
  ].each do |category|
    category = Category.new(category)
    category.save!
  end
  [
    { id: 1, user_id: 1, category_id: 2, content: 'パンはパンでも食べられないパンはなんだ？' },
    { id: 2, user_id: 1, category_id: 7, content: '世界三大珍味といえば、トリュフ、フォアグラ、後もう一つは？' },
    { id: 3, user_id: 2, category_id: 8, content: '1953年にペリー率いるアメリカ合衆国海軍の船が浦賀に来航した翌年に日米間で締結された条約の名前は？' },
    { id: 4, user_id: 2, category_id: 1, content: '文化庁の統計調査において日本で一番信者数が多い宗教は何系統？' },
    { id: 5, user_id: 3, category_id: 3, content: '請求書は英語でなんという？' },
  ].each do |quiz|
    quiz = Quiz.new(quiz)
    quiz.save!
  end

  [
    { id: 1, quiz_id: 1, content: "フライパン" },
    { id: 2, quiz_id: 2, content: "キャビア" },
    { id: 3, quiz_id: 3, content: "日米和親条約" },
    { id: 4, quiz_id: 4, content: "神道" },
    { id: 5, quiz_id: 5, content: "invoice" },
  ].each do |answer|
    answer = Answer.new(answer)
    answer.save!
  end

  [
    { id: 1, quiz_id: 1, content: "フライパン", name: '太郎' },
    { id: 2, quiz_id: 1, content: "パン", name: 'かな' },
    { id: 3, quiz_id: 2, content: "キャビア", name: '黒龍' },
    { id: 4, quiz_id: 2, content: "トリュフ", name: 'ハク' },
    { id: 5, quiz_id: 3, content: "日米和親条約", name: '時間' },
    { id: 6, quiz_id: 3, content: "日米条約", name: '因果応報' },
    { id: 7, quiz_id: 4, content: "神道", name: 'microscope' },
    { id: 8, quiz_id: 4, content: "幸福の化学", name: 'macro' },
    { id: 9, quiz_id: 5, content: "invoice", name: 'テル' },
    { id: 10, quiz_id: 5, content: "quotation", name: 'youru' },
  ].each do |response|
    record = Response.new(response)
    record.save!
  end
end
