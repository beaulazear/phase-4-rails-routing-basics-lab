class StudentsController < ApplicationController

    def index
        students = Student.all
        if students
            render json: students
        else
            render json: { error: "no students foind" }, status: :not_found
        end
    end

    def grades
        students = Student.order(grade: :desc)
        if students
            render json: students
        else
            render json: { error: "no students foind" }, status: :not_found
        end    
    end

    def highest_grade
        smartestKid = Student.order(grade: :desc).first

        if smartestKid
            render json: smartestKid
        else
            render json: { error: "dumb kids" }, status: :not_found
        end
    end

end
