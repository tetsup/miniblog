class FavoriteRankingMailer < ApplicationMailer
  def send_mail
    @ranking = Timeline.eager_load(:user).preload(:favorite_users).favorites_rank(10, Time.zone.yesterday)
    mail(
      to: User.pluck(:email),
      subject: '昨日のいいね！ランキング'
    )
  end
end
