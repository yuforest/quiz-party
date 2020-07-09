ActiveRecord::Base.transaction do
  [
    { email: "test@gmail.com", password: "password", password_confirmation: "password" },
  ].each do |item|
    admin = Admin.new(item)
    admin.save!
  end

  [
    { email: "test@gmail.com", password: "password", password_confirmation: "password" },
    { email: "test1@gmail.com", password: "password", password_confirmation: "password" },
    { email: "test2@gmail.com", password: "password", password_confirmation: "password" },
    { email: "test3@gmail.com", password: "password", password_confirmation: "password" },
    { email: "test4@gmail.com", password: "password", password_confirmation: "password" },
    { email: "test5@gmail.com", password: "password", password_confirmation: "password" },
  ].each do |u|
    user = User.new(u)
    user.skip_confirmation!
    user.save!
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
    { id: 3, user_id: 1, category_id: 8, content: '1953年にペリー率いるアメリカ合衆国海軍の船が浦賀に来航した翌年に日米間で締結された条約の名前は？' },
    { id: 4, user_id: 1, category_id: 1, content: '文化庁の統計調査において日本で一番信者数が多い宗教は何系統？' },
    { id: 5, user_id: 1, category_id: 3, content: '請求書は英語でなんという？' },
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
end
