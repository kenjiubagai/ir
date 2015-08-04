class Scraping

  agent = Mechanize.new
  page = agent.get("http://webapi.yanoshin.jp/webapi/tdnet/list/recent.xml")
  items =  page.search('tdnet')

  items.each do |item|
    tdid = item.at('id').inner_text
    time = item.at('pubdate').inner_text
    code = item.at('company_code').inner_text
    name = item.at('company_name').inner_text
    title = item.at('title').inner_text

    document_url = item.at('document_url').inner_text
    document_url.slice!("http://rd.webapi.yanoshin.jp/rd.php?")
    doc_url = document_url

    url_xbrl = item.at('url_xbrl').inner_text
    url_xbrl.slice!("http://rd.webapi.yanoshin.jp/rd.php?")
    xbrl_url = url_xbrl

    place = item.at('markets_string').inner_text

    item = Item.where(:tdid => tdid).first_or_initialize
    item.time = time
    item.code = code
    item.name = name
    item.title = title
    item.doc_url = doc_url
    item.xbrl_url = xbrl_url
    item.place = place
    item.save
    puts "----------------------"
  end
end

    # lists.each do |list|
    # puts list.at('pubdate').inner_text
    # end
    # puts page.at('company_code').inner_text
    # puts page.at('company_name').inner_text
    # puts page.at('title').inner_text
    # document_url = page.at('document_url').inner_text
    # document_url.slice!("http://rd.webapi.yanoshin.jp/rd.php?")
    # puts document_url
    # puts page.at('markets_string').inner_text