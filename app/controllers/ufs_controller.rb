class UfsController < ApplicationController
  
  
  def daily
    setting = Setting.first
    setting.request_count += 1
    setting.save

     @uf = UfRent.find_by(date: params[:date]) #tenemos que guardarlos en una variable para contar las consultas
     #render json: @uf.uf, status: :ok # para que devuelva un json cuando se consulte por postman
    respond_to do |format|
      if @uf
        format.json {  render json: @uf.uf , status: :ok }
      else
        format.json { render json: "Ingrese fecha correcta", status: :unprocessable_entity }
      end
    end
  end

  def stats 
    @setting = Setting.first
    render json: @setting.request_count, status: :ok
  end
end