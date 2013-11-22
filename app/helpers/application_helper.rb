# coding: utf-8
module ApplicationHelper
  def short_str(phon,dlina=32)
    if phon.size>dlina
    phon.slice(0..(dlina-1))<<"..." 
    else
      phon
    end
  end
  def short_link(str)
   n=str.split(/,|\.|;|_|\/|\\/)[0]
    if n!='' && n!=nil
    m=n.strip.mb_chars.downcase.capitalize
    short_str(m)
    else
      str
    end
  end

  
    #a=phon.split(/\,|\;|\/|\\|\.|[А-Яа-я]/)
    #a[0].each_char {|x| if x=~/\D/ then a[0].delete!(x) end}; 
    #phon.delete(,)
    #phon[/^(^(7|8|\+7)?\(?(\d{,5})?\)?)(\s|\-)?(\d(\s|\-)?\d(\s|\-)?\d(\s|\-)?\d(\s|\-)?\d(\s|\-)?\d?)$/]
end
