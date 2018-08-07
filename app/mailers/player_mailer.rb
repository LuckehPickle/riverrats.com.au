class PlayerMailer < ApplicationMailer

  ###
  # Sends a welcome email to the player.
  # @param [Player] player Player to send email to
  # @param [String] password Randomly generated password to send to player
  def welcome (player, password)
    @player = player
    @password = password
    email = @player.email.nil? || @player.email.blank? ? 'riverratspl@gmail.com' : @player.email
    email_with_name = "#{@player.full_name} <#{email}>"
    mail(
      to: email_with_name,
      subject: 'Welcome to the River Rats Poker League!'
    )
  end

end
