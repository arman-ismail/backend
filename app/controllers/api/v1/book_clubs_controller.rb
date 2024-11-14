module Api
  module V1
    class BookClubsController < ApplicationController
      before_action :set_book_club, only: [:show, :update, :destroy]
      before_action :authenticate_request
      
      def index
        @book_clubs = BookClub.all
        render json: @book_clubs
      end
      
      def show
        render json: @book_club
      end
      
      def create
        @book_club = BookClub.new(book_club_params)
        @book_club.admin = current_user
        
        if @book_club.save
          render json: @book_club, status: :created
        else
          render json: @book_club.errors, status: :unprocessable_entity
        end
      end
      
      def update
        if @book_club.admin == current_user && @book_club.update(book_club_params)
          render json: @book_club
        else
          render json: @book_club.errors, status: :unprocessable_entity
        end
      end
      
      def destroy
        if @book_club.admin == current_user
          @book_club.destroy
          head :no_content
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
      
      def analytics
        @book_club = BookClub.find(params[:id])
        reading_stats = @book_club.book_readings.group_by_month(:created_at).count
        render json: { reading_stats: reading_stats }
      end
      
      private
      
      def set_book_club
        @book_club = BookClub.find(params[:id])
      end
      
      def book_club_params
        params.require(:book_club).permit(:name, :description)
      end
    end
  end
end