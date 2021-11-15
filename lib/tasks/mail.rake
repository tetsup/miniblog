namespace :mail do
  desc '昨日のいいねランキングTop10をメール送信'
  task favorite_ranking: :environment do
    FavoriteRankingMailer.send_mail.deliver_now
  end
end
