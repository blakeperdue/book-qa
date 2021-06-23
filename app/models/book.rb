require 'active_record'

class Book < ActiveRecord::Base
  before_create :detect_math


  private

    def detect_math
      title = self.title.downcase
      if title.include?('algebra') ||
        title.include?('combinatoric') ||
        title.include?('geometry') ||
        title.include?('probability') ||
        title.include?('calculus') ||
        title.include?('equations') ||
        title.include?('statistic') ||
        title.include?('graph theory') ||
        title.include?('mathematics') ||
        title.include?('stochastic') ||
        title.include?('differential') ||
        title.include?('multivariable') ||
        title.include?('quantitative') ||
        title.include?('geometric')
        self.meta_is_math = true
        self.meta_exclude = true
      end
    end

end