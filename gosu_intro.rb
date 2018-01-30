# frozen_string_literal: true

require 'gosu'
require 'byebug'

class GosuIntro < Gosu::Window
  def initialize
    @height = 300
    @width = 700
    super(@width, @height, false)
    self.caption = 'Gosu Intro'

    # Game variables
    @background_image = Gosu::Image.new("media/background.png")
    @font = Gosu::Font.new(self, 'Courier', 40)
    @game_over = false

    # Player variables
    @player_image = Gosu::Image.new("media/player.png")
    @player_x = 10
    @player_speed = 3

    # Goal variables
    @goal_image = Gosu::Image.new("media/goal.png")
    @goal_x = 500
  end

  # Called by Gosu
  def update
    if Gosu.button_down? Gosu::KB_RIGHT
      @player_x = @player_x + @player_speed
    end

    if player_at_goal?
      game_over!
    end
  end

  # Called by Gosu
  def draw
    @background_image.draw(0, 0, 0)
    @player_image.draw(@player_x, 100, 0, 0.5, 0.5)
    @goal_image.draw(@goal_x, 100, 0, 0.5, 0.5)

    if game_over?
      @font.draw('Game Over!', 10, 10, 20)
    end
  end

  def player_at_goal?
    @player_x > @goal_x
  end

  def game_over!
    @game_over = true
  end

  def game_over?
    @game_over
  end
end

window = GosuIntro.new
window.show
