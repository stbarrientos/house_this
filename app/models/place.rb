require 'open-uri'
class Place < ActiveRecord::Base

  belongs_to :room
  has_many :comments

  validates :room_id, presence: true
  validates :address, presence: true
  validates :url, presence: true

  def get_specs(file)
    doc = Nokogiri::HTML(open("#{file}"))
    price = doc.css("div.main-row.home-summary-row span").text
    address = doc.css("header.zsg-content-header.addr h1").text.gsub(/(\r\n|\n|\r)/,"")
    beds = doc.css("header.zsg-content-header.addr h3 span")[0].text
    baths = doc.css("header.zsg-content-header.addr h3 span")[1].text
    sqft = doc.css("header.zsg-content-header.addr h3 span")[2].text
    amenities = ""
    doc.css("div.fact-group-container.zsg-content-component.top-facts ul").each do |ul| 
      ul.css("li").each do |li|
        amenities += li.text + ", "
      end
    end
    hash = {price: price, address: address, beds: beds, baths: baths, sqft: sqft, amenities: amenities} 
  end

  def update_specs
  end
end
