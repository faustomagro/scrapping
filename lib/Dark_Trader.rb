require "nokogiri"
require "open-uri"

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

def scrapping_data (page)

    arr_sym = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]/div[@class=""]/text()')
   
    symbol = []
  
    arr_sym.map do |sym|

      z = sym.to_s

      symbol << z

    end
   
    arr_values = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/a/text()')
    
    values = []

    arr_values.each do |val|

    w = val.to_s

    w.slice!(0)

    values << w

    end
    
  Hash[symbol.zip(values.map {|i| i})]

end

print scrapping_data (page)



