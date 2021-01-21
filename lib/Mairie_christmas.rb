
require "nokogiri"
require "open-uri"


def scrapping_mairie

  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

  arr_cities = page.xpath('//tr/td/p/a/@href').map{ |c|  c.to_s.delete_prefix('./95/').delete_suffix(".html")}

  arr_sites = []

  arr_cities.each do |city|

    z = "http://annuaire-des-mairies.com/95/#{city}.html".to_s     
 
    arr_sites << z

  end

  arr_emails = []

  arr_sites.each do |site|

    x = Nokogiri::HTML(open(site))

    arr_emails << x.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()").text

  end

  f = Hash[arr_cities.zip(arr_emails.map {|i| i})]

end

print scrapping_mairie
