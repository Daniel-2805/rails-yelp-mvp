class Review < ApplicationRecord
    belongs_to :restaurant
    validates :content, presence: true
    validates :rating, presence: true, inclusion: { in: (0..5),
        message: "%{value} is not a valid value" }
    end

    def destroy
      @review = Review.find(params[:id])
      @restaurant = @review.restaurant
      @review.destroy
      redirect_to restaurant_path(@restaurant)
end
