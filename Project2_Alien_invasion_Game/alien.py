import pygame
from pygame.sprite import Sprite

class Alien(Sprite):
          def __init__(self, ai_settings, screen):
                    # 初始化外星人并设置其起始位置
                    super(Alien, self).__init__()
                    self.screen = screen
                    self.ai_settings = ai_settings

                    # 加载外新人图片，并设置其rect属性
                    self.image = pygame.image.load(r"C:\\Users\\Meng Chenrui\\Python_AlienGame\\Alien\\alien_invasion\\images\\alien.bmp")
                    self.image = pygame.transform.scale(self.image, (40, 39))
                    self.rect = self.image.get_rect()

                    # 每个外星人最初都在屏幕左上角附近
                    self.rect.x = self.rect.width
                    self.rect.y = self.rect.height

                    # 存储外星人的准确位置
                    self.x = float(self.rect.x)

          def blitme(self):
                    self.screen.blit(self.image, self.rect)

          def update(self):
                    #向右移动外星人
                    self.x += (self.ai_settings.alien_speed_factor *
                                        self.ai_settings.fleet_direction)
                    self.rect.x = self.x

          def check_edges(self):
                    screen_rect = self.screen.get_rect()
                    if self.rect.right >= screen_rect.right:
                              return True
                    elif self.rect.left <= 0:
                              return True
