class Events::ExportsController < ApplicationController
  def create
    send_data Events::Export.new.call, filename: filename
  end

  private

  def filename
    'events-export.csv'
  end
end
